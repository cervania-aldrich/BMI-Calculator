import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    
    var bmiValue: String? //bmiValue is unknown until the bmi is calculated, then we pass it over.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recalculateButton.layer.cornerRadius = 10
       
        bmiLabel.text = bmiValue ?? ""
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination (Reference the new view controller with segue.destination)
        // Pass the selected object to the new view controller.
    }
    */

}
