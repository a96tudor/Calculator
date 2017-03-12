//
//  Number.swift
//  Calculator
//
//  A base class for the number representing classes
//
//  Created by Tudor Avram on 12/03/17.
//  Copyright © 2017 Tudor Avram. All rights reserved.
//

import Foundation

public class Number {
    
    var sign = "+"
    
    public init() {
        //
    }
    
    /**
     Method that changes the sign of the number
     */
    
    public func changeSign() {
        if self.sign == "+" {
            self.sign = "-"
        } else {
            self.sign = "+"
        }
    }
    
}
