import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    var todoString = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoLabel.text = todoString
    }
}
