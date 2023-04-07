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
        ftLabel.isHidden = true //Do not show the ft label
        ftHeightSlider.isHidden = true //Do not show the ftHeightSlider
    }
    
    @IBAction func unitSwitchChanged(_ sender: UISwitch) {
        
        if sender.isOn == true {
            metricUI() //Show the metric units in the UI
        } else {
            imperialUI() //Show the imperial units in the UI
        }
        
    }
    
    @IBAction func ftHeightSliderChanged(_ sender: UISlider) {
        let feet = sender.value
        let feetValue = String(format: "%.0f", feet)
        ftLabel.text = "\(feetValue)" + "ft"
    }
    

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        if unitSwitch.isOn == true {
            let height = sender.value
            let heightValue = String(format: "%.2f", height)
            heightLabel.text = "\(heightValue)" + "m"
        } else {
            let height = sender.value
            let heightValue = String(format: "%.0f", height)
            heightLabel.text = "\(heightValue)" + "in"
        }
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        if unitSwitch.isOn == true {
            let weight = sender.value
            let weightValue = String(format: "%.0f", weight)
            weightLabel.text = "\(weightValue)" + "Kg"
        } else {
            let weight = sender.value
            let weightValue = String(format: "%.0f", weight)
            weightLabel.text = "\(weightValue)" + "lbs"
            
        }
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //Use IBOutlets (as they are variables) to pass information from one function to another (the easiest way)
        let height = heightSlider.value
        let weight = weightSlider.value
        
        if ftHeightSlider.isHidden == true {
            calculatorBrain.calculateBMI(height, weight, isMetric: true)
            
        } else {
            let heightInFt = ftHeightSlider.value * 12
            let totalHeightInInches = height + heightInFt
            
            calculatorBrain.calculateBMI(totalHeightInInches, weight, isMetric: false)
        }
        
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
    
    func metricUI(){
        unitLabel.text = "Metric"
        
        //Change weight to Kgs
        weightLabel.text = "100Kg"
        weightSlider.value = 100
        weightSlider.maximumValue = 200
        
        //Changing height to metres
        heightSlider.value = 1.5
        heightSlider.maximumValue = 3
        ftLabel.isHidden = true
        heightLabel.text = "1.50" + "m"
        ftHeightSlider.isHidden = true
        
    }
    
    func imperialUI(){
        unitLabel.text = "Imperial"
        
        //Change weight to lbs
        weightLabel.text = "220lbs"
        weightSlider.value = 220
        weightSlider.maximumValue = 440
        
        //Change height to feet and inches
        heightSlider.value = 3
        heightSlider.maximumValue = 11
        ftLabel.isHidden = false
        ftLabel.text = "5" + "ft"
        heightLabel.text = "3" + "in"
        ftHeightSlider.isHidden = false
        ftHeightSlider.value = 5
        
    }
    
}

