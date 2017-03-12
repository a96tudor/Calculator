//
//  IntegerNumber.swift
//  Calculator
//
//  Created by Tudor Avram on 12/03/17.
//  Copyright © 2017 Tudor Avram. All rights reserved.
//

import Foundation


public class IntegerNumber: Number {
    
    private var val: Int64
    
    /**
        CONSTRUCTOR
        
        @param x:   the initial value of the number
     */
    public init(x: Int64) {
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
        @throws:        NumberException.OverflowException - if it overflows

    */
    public func addDigit(digit dStr:String) throws {
        let digit = (dStr as NSString).intValue
        
        self.val = try self.multInts(self.val, 10)
        self.val = try self.addInts(self.val, Int64(digit))
        
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
    
    /**
        Method that executes a given operation
     
        @param operation:   the operation to be performed
        @param otherTerm:   the other term we use in the operation
        @throws:        NumberException.OverflowException - if it overflows

    */
    public func exec(operation op: String, otherTerm other: IntegerNumber?) throws{
        
        switch op {
        case "+":
            self.val = try self.addInts(self.val, other!.val)
        case "-":
            self.val = try self.subInts(other!.val, self.val)
        case "*":
            self.val = try self.multInts(other!.val, self.val)
        default:
            print("not done yet")
        }
        
    }
    
    /**
        Function that tries to multiply 2 integers and throws and error if it overflows
     
        @param lhs:     The LHS term of the multiplication
        @param rhs:     The RHS term of the multiplication
        @returns:       The result of the multiplication
        @throws:        NumberException.OverflowException - if it overflows
    */
    private func multInts(_ lhs:Int64, _ rhs:Int64) throws -> Int64 {
        let tuple = Int64.multiplyWithOverflow(lhs, rhs)
        if tuple.1 {
            print("overflow")
            throw NumberException.OverflowException
        }
        return tuple.0
    }
    
    /**
        Function that substracts two Int64 numbers and throws an error if it overflows
        
        @param lhs:     The number to substract from
        @param rhs:     The number to substract
        @throws:        NumberException.OverflowException - if it overflows
    */
    private func subInts(_ lhs: Int64, _ rhs: Int64) throws -> Int64 {
        let tuple = Int64.subtractWithOverflow(lhs, rhs)
        if tuple.1 {
            print("overflow")
            throw NumberException.OverflowException
        }
        return tuple.0
    }
    
    /**
        Function that tries to add 2 integers and throws an error if it overflows
     
        @param lhs:     The LHS term of the addition
        @param rhs:     The RHS term of the addtion
        @returns:       The result of the addtion
        @throws:        NumberException.OverflowException - if it overflows
    */
    private func addInts(_ lhs:Int64, _ rhs:Int64) throws -> Int64 {
        let tuple = Int64.addWithOverflow(lhs, rhs)
        if tuple.1 {
            print("overflow")
            throw NumberException.OverflowException
        }
        return tuple.0
    }
    
}
