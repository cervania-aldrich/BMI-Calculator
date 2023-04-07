import UIKit

struct CalculatorBrain {
    
    var bmi:BMI?
    
    mutating func calculateBMI(_ height:Float, _ weight:Float) {
        
        let bmiValue = (weight) / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more food mate", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)) //Underweight
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Healthy BMI Score!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)) //Normal Weight
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less food mate", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)) //Overweight
        }
        
    }
    
    func getBMIValue() -> String {
        let bmiString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiString //Return the bmi to 1dp
    }
    
    func getAdvice() -> String {
        let advice = bmi?.advice ?? "No Advice"
        return advice
    }
    
    func getColor() -> UIColor {
        let color = bmi?.color ?? UIColor.white
        return color
    }
    
}
