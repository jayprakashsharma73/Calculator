//
//  ViewController.swift
//  Calculator
//
//  Created by Jay Prakash Sharma on 23/05/22.
//

import UIKit
class ViewController: UIViewController {
    //Properties
    var currentOperand:Double = 0
    var previousOperand:Double = 0
    var typing = true
    var operation = 0
    var result:Double = 0
    //Label
    @IBOutlet weak var Screen: UILabel!
    @IBAction func terminateApp(_ sender: UIButton) {
        exit(0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Numbers button
    @IBAction func numbersButton(_ sender: UIButton) {
        if typing == true {
            Screen.text = String(sender.tag)
            currentOperand = Double(Screen.text!)!
            typing = false
        } else{
            Screen.text = Screen.text! + String(sender.tag)
            currentOperand = Double(Screen.text!) ?? Double(sender.tag)
        }
    }
    //Calculation button
    @IBAction func Claculate(_ sender: UIButton) {
        if Screen.text != "" && sender.tag != 15{
            previousOperand = Double(Screen.text!) ?? result
            //Divide
            if sender.tag == 11 {
                Screen.text = Screen.text! +  "/"
                typing = false
            }
            //Multiply
            if sender.tag == 12 {
                Screen.text = Screen.text! + "x"
                typing = false
            }
            //Add
            if sender.tag == 13 {
                Screen.text = Screen.text! +  "+"
                typing = false
            }
            //Subtract
            if sender.tag == 14 {
                Screen.text = Screen.text! +  "-"
                typing = false
            }
            //Assinging Coming tag to Variable operation
            operation = sender.tag
            typing = false
        }else if sender.tag == 15 {
            //Divide
            if operation == 11{
                Screen.text = "\(Screen.text!) = \(String(previousOperand / currentOperand))"
                result = previousOperand / currentOperand
                Screen.text = String(result)
            }
            //Multiply
            else if operation == 12 {
                Screen.text = "\(Screen.text!) = \(String(previousOperand * currentOperand))"
                result = previousOperand * currentOperand
                Screen.text = String(result)
            }
            //Add
            else if operation == 13{
                
                Screen.text = "\(Screen.text!) = \(String(previousOperand + currentOperand))"
                result = previousOperand + currentOperand
                Screen.text = String(result)
                
            }
            //Subtract
            else if operation == 14{
                Screen.text = "\(Screen.text!) = \(String(previousOperand - currentOperand))"
                result = previousOperand - currentOperand
                Screen.text = String(result)
            }
        }
        // Reset Screen
        if sender.tag == 16{
            Screen.text = ""
            previousOperand = 0
            currentOperand = 0
            operation = 0
            result = 0
        }
    }
}

