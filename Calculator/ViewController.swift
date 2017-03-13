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
    var typed: Bool = false
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMult: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonEq: UIButton!
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var lastOperationUsed: UILabel!
    /**
        Action for the digit buttons
    */
    @IBAction func digitButtonAction (_ sender: UIButton) {
        let newDigit = sender.currentTitle!
        
        do {
            try curNumber.addDigit(digit: newDigit)
            typed = true
            updateLabel(curNumber)
        } catch {
            displayERROR(extra: "Too large")
        }
        
    }
    
    /**
        Action for the reset button
    */
    @IBAction func resetNumberAction(_ sender: UIButton) {
        curNumber.reset()
        if curNumber.isZero() {
            prevNumber?.reset()
            curOp = nil
        }
        updateLabel(curNumber)
        typed = false
    }
    
    /**
        Action for the operators
    */
    @IBAction func operatorAction(_ sender: UIButton) {
        if ( !typed ) {
            if sender.currentTitle! == "-" {
                // we update the sign of the number
                curNumber.changeSign()
            }
            // otherwise, do nothing
        } else {
            if prevNumber != nil {
                // we have to make the computation, so we use the current operator
                do {
                    try curNumber.exec(operation: self.curOp!, otherTerm: prevNumber)
                    prevNumber = IntegerNumber(old: curNumber)
                    curNumber = IntegerNumber()
                    if sender.currentTitle! == "=" {
                        updateLabel(prevNumber!)
                        prevNumber = nil
                        self.curOp = nil
                        lastOperationUsed.text = ""
                        typed = false
                    } else {
                        updateLabel(curNumber)
                        self.curOp = sender.currentTitle!
                        lastOperationUsed.text = self.curOp
                        typed = false
                    }

                } catch {
                    displayERROR(extra: "Overflow")
                }
                
            } else {
                if sender.currentTitle! == "=" {
                    return
                }
                // we don't have to make the computation
                prevNumber = IntegerNumber(old: curNumber)
                curNumber = IntegerNumber()
                updateLabel(curNumber)
                self.curOp = sender.currentTitle!
                lastOperationUsed.text = self.curOp
                typed = false
                updateButtons(status: false)
                sleep(10)
                updateButtons(status: true)
            }
        }
    }
    
    private func updateLabel(_ no: IntegerNumber) {
        outputLabel.text = no.getValue()
    }
    
    private func displayERROR(extra:String = "") {
        curNumber.reset()
        prevNumber?.reset()
        curOp = nil
        outputLabel.text = "ERROR!!!!!!!!!!!!!!"
        typed = false
    }
    
    private func updateButtons(status: Bool) {
        self.button0.isUserInteractionEnabled = status
        self.button1.isUserInteractionEnabled = status
        self.button2.isUserInteractionEnabled = status
        self.button3.isUserInteractionEnabled = status
        self.button4.isUserInteractionEnabled = status
        self.button5.isUserInteractionEnabled = status
        self.button6.isUserInteractionEnabled = status
        self.button7.isUserInteractionEnabled = status
        self.button8.isUserInteractionEnabled = status
        self.button9.isUserInteractionEnabled = status
        self.buttonC.isUserInteractionEnabled = status
        self.buttonMinus.isUserInteractionEnabled = status
        self.buttonPlus.isUserInteractionEnabled = status
        self.buttonMult.isUserInteractionEnabled = status
        self.buttonDivide.isUserInteractionEnabled = status
        self.buttonEq.isUserInteractionEnabled = status
        
    }
}

