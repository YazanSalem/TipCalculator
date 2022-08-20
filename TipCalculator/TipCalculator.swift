//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Yazan Salem on 8/20/22.
//

import Foundation

class TipCalculator{
    var totalBeforeTax: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    init(totalBeforeTax: Double, tipPercentage: Double){
        self.totalBeforeTax = totalBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip(){
        tipAmount = totalBeforeTax * tipPercentage
        totalAmount = tipAmount + totalBeforeTax
    }
}
