//
//  ViewController.swift
//  Calculator
//
//  Created by Tudor Avram on 12/03/17.
//  Copyright © 2017 Tudor Avram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var curNumber = IntegerNumber()
    var prevNumber: IntegerNumber? = nil
    var curOp: String? = nil
    
    @IBOutlet weak var outputLabel: UILabel!
    
    /**
        Action for the digit buttons
    */
    @IBAction func digitButtonAction (_ sender: UIButton) {
        let newDigit = sender.currentTitle!
        
        do {
            try curNumber.addDigit(digit: newDigit)
        } catch {
            // DO NOTHING :D
        }
        updateLabel()
    }
    
    /**
        Action for the reset button
    */
    @IBAction func resetNumberAction(_ sender: UIButton) {
        curNumber.reset()
        updateLabel()
    }
    
    /**
        Action for the operators
    */
    @IBAction func operatorAction(_ sender: UIButton) {
        if ( curNumber.isZero() ) {
            if sender.currentTitle! == "-" {
                // we update the sign of the number
                curNumber.changeSign()
            }
            // otherwise, do nothing
        } else {
            if prevNumber != nil {
                // we have to make the computation, so we use the current operator

            } else {
                if sender.currentTitle! == "=" {
                    return
                }
                // we don't have to make the computation
                prevNumber = IntegerNumber(old: curNumber)
                curNumber = IntegerNumber()
                updateLabel()
            }
        }
    }
    
    private func updateLabel() {
        outputLabel.text = curNumber.getValue()
    }
    
}

