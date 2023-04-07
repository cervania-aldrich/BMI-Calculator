import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var unitSwitch: UISwitch!
    @IBOutlet weak var ftLabel: UILabel!
    @IBOutlet weak var ftHeightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calculateButton.layer.cornerRadius = 10 //Round the corners of the calculate button
        unitLabel.text = "Metric"
        ftLabel.text = ""
    }
    
    @IBAction func unitSwitchChanged(_ sender: UISwitch) {
        
        if sender.isOn == true {
            
            //Metric
            
            unitLabel.text = "Metric"
            //Change weight to Kgs
            weightSlider.value = 100
            weightSlider.maximumValue = 200
            weightLabel.text = "100Kg"
            
            //Changing height to metres
            ftLabel.text = ""
            heightLabel.text = "1.50" + "m"
            ftHeightSlider.isEnabled = false
            
        } else {
            
            //Imperial
            
            unitLabel.text = "Imperial"
            //Change weight to lbs
            weightLabel.text = "220lbs"
            weightSlider.value = 220
            weightSlider.maximumValue = 440
            
            //Change height to feet and inches
            ftLabel.text = "4" + "ft"
            heightLabel.text = "5" + "In"
            ftHeightSlider.isEnabled = true
            ftHeightSlider.value = 4
    
            
        }
        
    }
    
    @IBAction func ftHeightSliderChanged(_ sender: UISlider) {
        let feet = sender.value
        let feetValue = String(format: "%.0f", feet)
        ftLabel.text = "\(feetValue)" + "ft"
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
        
        calculatorBrain.calculateBMI(height, weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self) //Triggering the segue we created in the Storyboard.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultViewController //The new view controller is initialized when the segue is performed.
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.adviceValue = calculatorBrain.getAdvice()
            destinationVC.colorValue = calculatorBrain.getColor()
            
        }
    }
    
}

