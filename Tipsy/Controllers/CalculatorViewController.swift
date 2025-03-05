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
        if zeroPctButton.isSelected == true {
//            tenPctButton.isSelected = false
//            twentyPctButton.isSelected = false
            print("No tip")
        } else if tenPctButton.isSelected == true {
//            zeroPctButton.isSelected = false
//            twentyPctButton.isSelected = false
            print("10% was selected")
        } else {
//            zeroPctButton.isSelected = false
//            tenPctButton.isSelected = false
            print("20% was selected")
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //Get the stepper value using sender.value, round it down to a whole number then set it as the text in
               //the splitNumberLabel
               splitNumberLabel.text = String(format: "%.0f", sender.value)
               
               //Set the numberOfPeople property as the value of the stepper as a whole number.
               numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(numberOfPeople)
    }
    
}

