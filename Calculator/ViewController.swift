//
//  ViewController.swift
//  Calculator
//
//  Created by Mohammed Faizuddin on 1/23/18.
//  Copyright © 2018 Faiz Tech. All rights reserved.
//

import UIKit


enum modes{
   case NOT_SET
   case ADDITION
   case SUBSTRACTION
   
}

class ViewController: UIViewController {

   var labelString:String = ""
   var currentMode:modes = modes.NOT_SET
   var savedNum:Int = 0
   var lastButtonWasMode:Bool = false
   
   @IBOutlet weak var label: UILabel!
   
   
   @IBAction func tapped0(_ sender: Any) {tappedNumber(num: 0)}
   @IBAction func tapped1(_ sender: Any) {tappedNumber(num: 1)}
   @IBAction func tapped2(_ sender: Any) {tappedNumber(num: 2)}
   @IBAction func tapped3(_ sender: Any) {tappedNumber(num: 3)}
   @IBAction func tapped4(_ sender: Any) {tappedNumber(num: 4)}
   @IBAction func tapped5(_ sender: Any) {tappedNumber(num: 5)}
   @IBAction func tapped6(_ sender: Any) {tappedNumber(num: 6)}
   @IBAction func tapped7(_ sender: Any) {tappedNumber(num: 7)}
   @IBAction func tapped8(_ sender: Any) {tappedNumber(num: 8)}
   @IBAction func tapped9(_ sender: Any) {tappedNumber(num: 9)}

   
   @IBAction func tappedMinus(_ sender: Any) {
      changeMode(newMode: modes.SUBSTRACTION)
   }
   
   @IBAction func tappedPlus(_ sender: Any) {
      changeMode(newMode: modes.ADDITION)
   }
   
   @IBAction func tappedEquals(_ sender: Any) {
      guard let num:Int = Int(labelString) else {
         label.text = "Error has Occured"
         return
      }
      if currentMode == modes.NOT_SET || lastButtonWasMode{
         return
      }
      
      if currentMode == modes.ADDITION{
         savedNum += num
      }
      else if currentMode == modes.SUBSTRACTION{
         savedNum -= num
      }
      currentMode = modes.NOT_SET
      labelString = "\(savedNum)"
      updateText()
      lastButtonWasMode = true
   }
   
   @IBAction func tappedClear(_ sender: Any) {
      savedNum = 0
      labelString = "0"
      label.text = "0"
      currentMode = modes.NOT_SET
      lastButtonWasMode = false
   }
   
   
   
   
   func tappedNumber(num:Int)  {
      if lastButtonWasMode{
         lastButtonWasMode = false
         labelString = "0"
      }
   
      labelString =   labelString.appending("\(num)")
      updateText()
   }
   
  
   func updateText()  {
      
      guard let labelInt:Int = Int(labelString) else
      {
         label.text = "Int conversion failed"
         return
      }
      
      if currentMode == modes.NOT_SET{
      savedNum = labelInt
      }
      let formatter:NumberFormatter = NumberFormatter()
      formatter.numberStyle = NumberFormatter.Style.decimal
      let num:NSNumber = NSNumber(value: labelInt)
      label.text = formatter.string(from:num)
   }
   
   
   
   func changeMode(newMode:modes)  {
      if savedNum == 0
      {
         return
      }
      currentMode = newMode
      lastButtonWasMode = true
   }
   
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

