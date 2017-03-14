//
//  ViewController.swift
//  Tipsy Tip
//
//  Created by Sharma, Surbhi on 3/11/17.
//  Copyright © 2017 LittleApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTxt: UITextField!
    
    @IBOutlet weak var tipTab: UISegmentedControl!
    
    @IBOutlet weak var settingsBtn: UIBarButtonItem!
    
    @IBOutlet weak var tipValueLbl: UILabel!
    
    @IBAction func tapDone(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var youPayLbl: UILabel!

    @IBAction func billChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("defaultTip")
        assignTipAndTotal(defaultTip)

    }

    @IBAction func billTxtTapped(sender: AnyObject) {
        view.endEditing(false)
    }
    
    @IBAction func tipsClicked(sender: AnyObject) {
        assignTipAndTotal(tipTab.selectedSegmentIndex)
    }
    override func viewDidLoad() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("defaultTip")
        setValues()
        assignTipAndTotal(defaultTip)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("defaultTip")
        setValues()
        viewDidLoad()
        assignTipAndTotal(defaultTip)
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    func setValues(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let tip1 = defaults.stringForKey("tip1")
        let tip2 = defaults.stringForKey("tip2")
        let tip3 = defaults.stringForKey("tip3")
        let defaultTip = defaults.integerForKey("defaultTip")
        
        if(tip1 == nil){
            tipTab.setTitle("10%", forSegmentAtIndex: 0)
        }else{
            tipTab.setTitle(tip1! + "%", forSegmentAtIndex: 0)
        }
        
        if(tip2 == nil){
            tipTab.setTitle("15%", forSegmentAtIndex: 1)
        }else{
            tipTab.setTitle(tip2! + "%", forSegmentAtIndex: 1)
        }
        
        if(tip3 == nil){
            tipTab.setTitle("20%", forSegmentAtIndex: 2)
        }else{
            tipTab.setTitle(tip3! + "%", forSegmentAtIndex: 2)
        }
        
        tipTab.selectedSegmentIndex = defaultTip

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func assignTipAndTotal(index: Int)
    {
        var pay = 0.0
        if(billTxt.text != nil){
            var bill = Double(billTxt.text!)
            if(bill != nil){
                let selectedIndex = index
                print("selectedIndex \(selectedIndex)")
                let tip = tipTab.titleForSegmentAtIndex(selectedIndex)
                let tipStr = String(tip!.characters.dropLast())
                print("tipStr: \(tipStr)")
                let tipInt = Double(tipStr)!/100
                print("tipInt: \(tipInt)")
                
                pay = bill! * tipInt
                tipValueLbl.text = "$ \(String(format: "%.2f", pay))"
                youPayLbl.text = "$ \(String(format: "%.2f", pay + bill!))"
                
            }
            else{
                tipValueLbl.text = "$ 0.00"
                youPayLbl.text = "$ 0.00"
            }
        }
        else{
            tipValueLbl.text = "$ 0.00"
            youPayLbl.text = "$ 0.00"
        }

    }


}

