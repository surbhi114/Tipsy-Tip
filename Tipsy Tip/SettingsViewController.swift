//
//  SettingsViewController.swift
//  Tipsy Tip
//
//  Created by Sharma, Surbhi on 3/12/17.
//  Copyright © 2017 LittleApps. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tip3Txt: UITextField!
    @IBOutlet weak var tip2Txt: UITextField!
    @IBOutlet weak var tip1Txt: UITextField!
    
    @IBOutlet weak var defaultTipTab: UISegmentedControl!
    
    @IBAction func openKeyboard(sender: AnyObject) {
        view.endEditing(false)
    }
    @IBAction func tapOutside(sender: AnyObject) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let tip1 = defaults.stringForKey("tip1")
        let tip2 = defaults.stringForKey("tip2")
        let tip3 = defaults.stringForKey("tip3")
        let defaultTip = defaults.integerForKey("defaultTip")
        
        if(tip1 == nil){
            tip1Txt.text = "10"
            defaultTipTab.setTitle("10%", forSegmentAtIndex: 0)
        }else{
            tip1Txt.text = tip1
            defaultTipTab.setTitle("\(tip1!)%", forSegmentAtIndex: 0)
        }
        
        if(tip2 == nil){
            tip2Txt.text = "15"
            defaultTipTab.setTitle("15%", forSegmentAtIndex: 1)
        }else{
            tip2Txt.text = tip2
            defaultTipTab.setTitle("\(tip2!)%", forSegmentAtIndex: 1)
        }
        
        if(tip3 == nil){
            tip3Txt.text = "20"
            defaultTipTab.setTitle("20%", forSegmentAtIndex: 2)
        }else{
            tip3Txt.text = tip3
            defaultTipTab.setTitle("\(tip3!)%", forSegmentAtIndex: 2)
        }
        
        
        defaultTipTab.selectedSegmentIndex = defaultTip
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tip1defaultChanged(sender: AnyObject) {
        let tip1 = tip1Txt.text
        defaultTipTab.setTitle("\(tip1!)%", forSegmentAtIndex: 0)
    }
   
    @IBAction func tip2DefaultChanged(sender: AnyObject) {
        let tip2 = tip2Txt.text
        defaultTipTab.setTitle("\(tip2!)%", forSegmentAtIndex: 1)
    }
    
    @IBAction func tip3DefaultChanged(sender: AnyObject) {
        let tip3 = tip3Txt.text
        defaultTipTab.setTitle("\(tip3!)%", forSegmentAtIndex: 2)
    }
    
    @IBAction func trashClicked(sender: AnyObject) {
        //reset all the values
        tip1Txt.text = "10"
        tip2Txt.text = "15"
        tip3Txt.text = "20"
        defaultTipTab.setTitle("10%", forSegmentAtIndex: 0)
        defaultTipTab.setTitle("15%", forSegmentAtIndex: 1)
        defaultTipTab.setTitle("20%", forSegmentAtIndex: 2)
        defaultTipTab.selectedSegmentIndex = 0
        saveClicked(tip1Txt)
        
    }

    @IBAction func saveClicked(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tip1Txt.text, forKey: "tip1")
        defaults.setObject(tip2Txt.text, forKey: "tip2")
        defaults.setObject(tip3Txt.text, forKey: "tip3")
        defaults.setInteger(defaultTipTab.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
