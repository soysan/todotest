import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    var textArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArr.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = textArr[indexPath.row]
        cell.imageView!.image = UIImage(named: "focus")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        nextVC.todoString = textArr[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 6
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textArr.append(textField.text!)
        textField.resignFirstResponder()
        textField.text = ""
        tableView.reloadData()
        return true
    }

}

//<div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
//Image by <a href="https://pixabay.com/users/5187396-5187396/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=2258582">Yatheesh Gowda</a> from <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=2258582">Pixabay</a>
