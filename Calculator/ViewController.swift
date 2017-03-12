//
//  ViewController.swift
//  Calculator
//
//  Created by Tudor Avram on 12/03/17.
//  Copyright © 2017 Tudor Avram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonONEAction (_ sender: UIButton) {
        
        //let sender_name = sender.titleLabel!.text
        let sender_name = ""
        print(sender_name)
        
    }
    
    var curNumber  = 0

    
    func updateCurNumber(dig new_digit:Int) {
        curNumber = curNumber * 10 + new_digit
    }
    


    

}

