//
//  TipCalc.swift
//  Tip Calculator
//
//  Created by Steven Yang on 8/9/16.
//  Copyright © 2016 Yato. All rights reserved.
//

import Foundation

class TipCalc {
    
    private var _billAmount = 0.0
    private var _tipPercent = 0.0
    private var _tipAmount = 0.0
    private var _totalAmount = 0.0
    private var _numberOfPeople = 1
    private var _splitCost = 0.0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    var numberOfPeople: Int {
        get {
            return _numberOfPeople
        } set {
            _numberOfPeople = newValue
        }
    }
    
    var splitCost: Double {
        return _splitCost
    }
    
    init(billAmount: Double, tipPercent: Double) {
        self._billAmount = billAmount
        self.tipPercent = tipPercent
    }
    
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = tipAmount + billAmount
    }
    
    func splitBill() {
        _splitCost = totalAmount / Double(numberOfPeople)
    }
    
    
}


