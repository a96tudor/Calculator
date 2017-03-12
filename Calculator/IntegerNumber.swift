//
//  Number.swift
//  Calculator
//
//  Created by Tudor Avram on 12/03/17.
//  Copyright © 2017 Tudor Avram. All rights reserved.
//

import Foundation


public class IntegerNumber: Number {
    
    private var val: Int
    
    /**
        CONSTRUCTOR
        
        @param x:   the initial value of the number
     */
    public init(x: Int) {
        self.val  = x
        super.init()
    }
    
    /**
        COPY CONSTRUCTOR
     
        @param old:     the number whose value we want to copy
    */
    public init(old: IntegerNumber) {
        self.val = old.val
        super.init()
    }
    
    /**
        EMPTY CONSTRUCTOR
        
        Sets the value to 0 by default
    */
    public override init() {
        self.val = 0
        super.init()
    
    }
    
    /**
        Method that adds a digit to the number
        
        @param digit:   the new digit to be inserted at the end of the number, as a string
    */
    public func addDigit(digit dStr:String) {
        let digit = (dStr as NSString).intValue
        self.val = self.val*10 + Int(digit)
    }
    
    /**
        Method that resets the current number and the sign.
     
        @param value:   the new value of the number. (Default 0)
    */
    public func reset(value x:Int = 0) {
        self.val = 0
        self.sign = "+"
    }
    
    /**
        Method that returns the current value as a String
     
        @returns:   the value current value, taking the sign into account
    */
    public func getValue() -> String {
        var true_value = self.val
        if self.sign == "-" {
            true_value = true_value * -1
        }
        return String(true_value)
    }
    
    /**
        Method that checks wether the current value is 0 or not
     
        @returns:   true - if the current value is 0
                    false - otherwise
    */
    public func isZero() -> Bool {
        return (val == 0)
    }
    
}
