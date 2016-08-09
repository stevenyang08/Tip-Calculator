//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Steven Yang on 8/8/16.
//  Copyright © 2016 Yato. All rights reserved.
//

import UIKit

class TipsyVC: UIViewController {
    
    // MARK: - @IBOulets
    
    @IBOutlet weak var tipsyTitleView: UIView!
    @IBOutlet weak var tipsyTitleLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipCostLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var eachBillLabel: UILabel!
    
    // MARK: - @Properties
    
    var tipCalc = TipCalc(billAmount: 0.0, tipPercent: 0.0)
    
    // MARK: - Initialize Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipPercentValue()
    }
    
    
    // MARK: - @IBActions
    
    @IBAction func billAmountChanged(_ sender: AnyObject) {
        calculateTip()
    }
    
    @IBAction func tipPercentChanged(_ sender: AnyObject) {
        calculateTip()
    }
    
    @IBAction func splitChanged(_ sender: AnyObject) {
        calculateTip()
    }
    // MARK: - @Functions
    
    func calculateTip() {
        tipCalc.tipPercent = Double(tipSlider.value)
        tipCalc.billAmount = ((billTextField.text)! as NSString).doubleValue
        tipCalc.numberOfPeople = Int(splitSlider.value)
        tipCalc.calculateTip()
        tipCalc.splitBill()
        updateUI()
    }
    
    func updateUI() {
        tipCostLabel.text = String(format: "$%0.2f", tipCalc.tipAmount)
        totalBillLabel.text = String(format: "$%0.2f", tipCalc.totalAmount)
        eachBillLabel.text = String(format: "$%0.2f", tipCalc.splitCost)
        tipPercentValue()
    }
    
    func tipPercentValue() {
        tipLabel.text = "TIP \(Int(tipSlider.value * 100))%"
        splitLabel.text = "SPLIT \(tipCalc.numberOfPeople)"
    }
    
}

