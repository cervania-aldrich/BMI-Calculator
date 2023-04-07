import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    
    var bmiValue: String? //bmiValue is unknown until the bmi is calculated, then we pass it over.
    var adviceValue:String?
    var colorValue:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recalculateButton.layer.cornerRadius = 10 //Round the corners of the recalculate button
       
        bmiLabel.text = bmiValue
        adviceLabel.text = adviceValue
        view.backgroundColor = colorValue
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true) //Do not need self, but it is there to explicitly show we are calling a method from the super class, UIViewController.
    }

    

}
