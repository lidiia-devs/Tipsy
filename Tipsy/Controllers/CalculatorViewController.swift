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
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
}

