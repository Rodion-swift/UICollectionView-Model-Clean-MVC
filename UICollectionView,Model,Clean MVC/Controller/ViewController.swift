
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemMenuArray: [Menu] = {
       var blancMenu = Menu()
        blancMenu.name = "Coca-cola"
        blancMenu.imageName = "kola"
        
    var blancMenu2 = Menu()
        blancMenu2.name = "Kofe"
        blancMenu2.imageName = "kofe"
        
        return [blancMenu, blancMenu2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        collectionView.dataSource = self as! UICollectionViewDataSource
        collectionView.delegate = self as! UICollectionViewDelegate
        
    }
    
    // !!!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  // переопределяем унаследованный метод
        if segue.identifier == "showVC" {
            if let vc = segue.destination as? DetailViewController {
                let menu = sender as? Menu // ловим menu
                print(menu ?? "nil")
                vc.menu = menu
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell { // as? так как ячейка у нас кастомная
            
            itemCell.menu = itemMenuArray[indexPath.row]  // отображение в ячейке
            
            return itemCell
        }
        
        return UICollectionViewCell()
    }
    
    // Method Delegate - для открытия в другом окне
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = itemMenuArray[indexPath.row] // для открытия именно выбранного row
        self.performSegue(withIdentifier: "showVC", sender: menu) // для открытия экрана
    }
    
}
