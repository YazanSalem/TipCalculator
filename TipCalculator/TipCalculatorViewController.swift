//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Yazan Salem on 8/20/22.
//

import UIKit

class TipCalculatorViewController: UIViewController{
    
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var eachPersonTotalLabel: UILabel!
    
    @IBOutlet weak var totalBeforeTaxTextField:UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var splitBetweenLabel: UILabel!
    @IBOutlet weak var splitBetweenSlider: UISlider!
    
    var tipCalculator = TipCalculator(totalBeforeTax: 0, tipPercentage: 0.01)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        totalBeforeTaxTextField.becomeFirstResponder()
    }
    
    func calculateTotal(){
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100
        tipCalculator.totalBeforeTax = (totalBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI(){
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        
        let splitBetween: Int = Int(splitBetweenSlider.value)
        
        eachPersonTotalLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(splitBetween))
    }
    
    // Mark: - Target / Action
    
    @IBAction func tipSliderValueChanged(sender: Any){
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateTotal()
    }
    
    @IBAction func splitBetweenValueChanged(sender: Any){
        splitBetweenLabel.text = "Split: \(Int(splitBetweenSlider.value))"
        calculateTotal()
    }
    
    @IBAction func totalBeforeTaxFieldChanged(sender: Any){
        calculateTotal()
    }
}
