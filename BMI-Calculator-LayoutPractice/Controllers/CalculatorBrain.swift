import UIKit

struct CalculatorBrain {
    
    ///bmi is a var because the bmi is different for underweight, normal weight and overweight individuals. It is also optional because the bmi is not defined until the user presses the Calculate button from the CalculateViewController.
    var bmi:BMI?
    
    ///A function that calculates the BMI. The BMI requires a height and weight values according to the BMI formula.
    ///
    ///If metric units are used, the height and weight must be in Meters and Kilograms respectively.
    ///If imperial units are used, the height and weight must be in Inches and Pounds respectively.
    mutating func calculateBMI(_ height:Float, _ weight:Float, isMetric:Bool) {
        
        var bmiValue:Float
        
        if isMetric == true {
            bmiValue = (weight) / pow(height, 2) //BMI formula using metric units.
        } else {
            bmiValue = ((weight) / (pow(height, 2))) * 703 //BMI formula using imperial units.
        }
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Unhealthy BMI Score. Must gain weight.", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)) //Underweight
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Healthy BMI Score! Well done.", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)) //Normal Weight
        } else {
            bmi = BMI(value: bmiValue, advice: "Unhealthy BMI Score. Must lose weight.", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)) //Overweight
        }
        
    }
    
    ///The function that returns the bmi values as a formatted string, based on if the bmi was for underweight, normal-weight or overweight individuals.
    func getBMIValue() -> String {
        let bmiString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiString //Return the bmi to 1dp
    }
    
    ///The function that returns the advice that the user should follow based on their BMI score.
    func getAdvice() -> String {
        let advice = bmi?.advice ?? "No Advice"
        return advice
    }
    
    ///The function that returns a color. This color reflects on their BMI score.
    func getColor() -> UIColor {
        let color = bmi?.color ?? UIColor.white
        return color
    }
    
}
