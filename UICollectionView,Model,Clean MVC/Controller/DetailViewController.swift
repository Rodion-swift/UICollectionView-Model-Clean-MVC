

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView! {
        
        didSet {
            
            guard let image = menu?.imageName else { return } // Example optional bounding
            imageView.image = UIImage(named: image)
        }
    }
 
    
    @IBOutlet weak var nameLabel: UILabel! {
        
        didSet {
            nameLabel.text = menu?.name  // "?" - optional changing
        }
    }
    
    
    var menu: Menu? 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

}
