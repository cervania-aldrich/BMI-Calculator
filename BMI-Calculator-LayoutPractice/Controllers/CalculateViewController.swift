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
            metricUI() //Show the metric units in the UI, if the switch is on.
        } else {
            imperialUI() //Show the imperial units in the UI, if the switch is off.
        }
        
    }
    
    @IBAction func ftHeightSliderChanged(_ sender: UISlider) {
        let ft = sender.value //Reference to the current value of the slider
        let ftValue = String(format: "%.0f", ft) //Reference to the ft, but formatted as a string.
        ftLabel.text = "\(ftValue)" + "ft" //Assign the ft string to the text property of the ftLabel.
        
    }
    

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        if unitSwitch.isOn == true {
            //If, when the user is using the height slider and the switch is ON, then change the UI to show the metric units.
            
            let height = sender.value //Reference to the current value of the slider
            let heightValue = String(format: "%.2f", height) //Reference to the height, but formatted as a string.
            heightLabel.text = "\(heightValue)" + "m" //Assign the height to the text property of the heightLabel, concatenated with "m" (metres).
            
        } else {
            //Otherise, when the user is using the height slider and the switch is OFF, then change the UI to show the imperial units.
    
            let height = sender.value
            let heightValue = String(format: "%.0f", height)
            heightLabel.text = "\(heightValue)" + "in" //Assign the height to the text property of the heightLabel, concatenated with "in" (inches).
            
        }
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        if unitSwitch.isOn == true {
            //If, when the user is using the weight slider and the switch is ON, then change the UI to show the metric units.
            
            let weight = sender.value //Reference to the current value of the slider
            let weightValue = String(format: "%.0f", weight) //Reference to the weight, but formatted as a string.
            weightLabel.text = "\(weightValue)" + "Kg" //Assign the weight to the text property of the weightLabel, concatenated with "kg" (kilograms).
            
        } else {
            //Otherise, when the user is using the weight slider and the switch is OFF, then change the UI to show the imperial units.
            
            let weight = sender.value //Reference to the current value of the slider
            let weightValue = String(format: "%.0f", weight) //Reference to the weight, but formatted as a string.
            weightLabel.text = "\(weightValue)" + "lbs" //Assign the weight to the text property of the weightLabel, concatenated with "lbs" (pounds).
            
        }
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //Use IBOutlets (as they are variables) to pass information from one function to another (the easiest way)
        let height = heightSlider.value
        let weight = weightSlider.value
        
        if ftHeightSlider.isHidden == true {
            calculatorBrain.calculateBMI(height, weight, isMetric: true) //Calculate the BMI using the metric-formula.
            
        } else {
            let heightInFt = ftHeightSlider.value * 12 //Convert ft into inches (for the BMI formula)
            let totalHeightInInches = height + heightInFt //Sum of the two height slider values in inches.
            
            calculatorBrain.calculateBMI(totalHeightInInches, weight, isMetric: false) //Calculate the BMI using the imperial-formula.
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self) //Triggering the segue we created in the Storyboard.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" { //Validate the segue to be triggered (Especially useful if the app had more screens)
            
            let destinationVC = segue.destination as! ResultViewController //The new view controller is initialized when the segue is performed.
            destinationVC.bmiValue = calculatorBrain.getBMIValue() //Pass the BMI to the ResultsViewController
            destinationVC.adviceValue = calculatorBrain.getAdvice() //Pass the advice to the ResultsViewController
            destinationVC.colorValue = calculatorBrain.getColor() //Pass the colorValue to the ResultsViewController
            
        }
    }
    
    func metricUI(){
        unitLabel.text = "Metric"
        
        //Change weight to Kgs
        weightLabel.text = "100Kg"
        weightSlider.value = 100
        weightSlider.maximumValue = 200
        
        //Changing height to metres
        ftLabel.isHidden = true
        ftHeightSlider.isHidden = true
        heightSlider.value = 1.5
        heightSlider.maximumValue = 3
        heightLabel.text = "1.50" + "m"
        
    }
    
    func imperialUI(){
        unitLabel.text = "Imperial"
        
        //Change weight to lbs
        weightLabel.text = "220lbs"
        weightSlider.value = 220
        weightSlider.maximumValue = 440
        
        //Change height to feet and inches
        ftHeightSlider.isHidden = false
        ftLabel.isHidden = false
        ftLabel.text = "5" + "ft"
        heightLabel.text = "3" + "in"
        ftHeightSlider.value = 5
        heightSlider.value = 3
        heightSlider.maximumValue = 11
        
    }
    
}

