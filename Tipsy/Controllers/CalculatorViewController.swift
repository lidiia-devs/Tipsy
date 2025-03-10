//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.1
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    //MARK: Outlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    //MARK: Actions
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleRemovePercentageSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleRemovePercentageSign)!
        
        tip = buttonTitleAsNumber / 100
      //  if zeroPctButton.isSelected == true {
////            tenPctButton.isSelected = false
////            twentyPctButton.isSelected = false
//            print("No tip")
//        } else if tenPctButton.isSelected == true {
////            zeroPctButton.isSelected = false
////            twentyPctButton.isSelected = false
//            print("10% was selected")
//        } else {
////            zeroPctButton.isSelected = false
////            tenPctButton.isSelected = false
//            print("20% was selected")
//        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //Get the stepper value using sender.value, round it down to a whole number then set it as the text in
               //the splitNumberLabel
               splitNumberLabel.text = String(format: "%.0f", sender.value)
               
               //Set the numberOfPeople property as the value of the stepper as a whole number.
               numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    
                let bill = billTextField.text!
                
        if bill != "" {
            //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
            billTotal = Double(bill)!
            //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            //Round the result to 2 decimal places and turn it into a String.
            finalResult = String(format: "%.2f", result)
          
//            let secondVC = ResultViewController()
//            self.present(secondVC, animated: true, completion: nil)
            
            performSegue(withIdentifier: "goToResult", sender: self)
        }
//        print(numberOfPeople)
//        billTotal = Double(billTextField.text ?? "0")!
//        let sumWithTip = (billTotal + (billTotal * tip)) / Double(numberOfPeople)
//        let totalSum = String(format: "%.2f", sumWithTip)
//        print(totalSum)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tipPercentage = Int(tip * 100)
        }
    }
    
}

