import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calculateButton.layer.cornerRadius = 10 //Round the corners of the calculate button
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = sender.value
        let heightValue = String(format: "%.2f", height)
        heightLabel.text = "\(heightValue)" + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = sender.value
        let weightValue = String(format: "%.0f", weight)
        weightLabel.text = "\(weightValue)" + "Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value //Use IBOutlets (as they are variables) to pass information from one function to another (the easiest way)
        let weight = weightSlider.value
        
        let bmi = (weight) / pow(height, 2)
        print(bmi)
        
    }
    
}

