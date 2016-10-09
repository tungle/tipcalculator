//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Tung Le on 9/10/2016.
//  Copyright © 2016 Tung Le. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var thresField1: UITextField!
    @IBOutlet weak var thresField2: UITextField!
    @IBOutlet weak var thresField3: UITextField!
    
    var tipPercentages = [0,1,2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thresField1.becomeFirstResponder()
        
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        
        
        loadSettings(defaults: defaults)
        thresField1.text = "\(tipPercentages[0])"
        thresField2.text = "\(tipPercentages[1])"
        thresField3.text = "\(tipPercentages[2])"
        
      
        
    }
    
    func loadSettings(defaults: UserDefaults) {
        var thres1 = defaults.integer(forKey: "thres1")
        if thres1 == 0 {
            thres1 = 18
        }
        
        var thres2 = defaults.integer(forKey: "thres2")
        if thres2 == 0 {
            thres2 = 20
        }
        
        var thres3 = defaults.integer(forKey: "thres3")
        if thres3 == 0 {
            thres3 = 25
        }
        tipPercentages[0] = thres1
        tipPercentages[1] = thres2
        tipPercentages[2] = thres3
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let thresVal1 = Double(thresField1.text!) ?? 0
        let thresVal2 = Double(thresField2.text!) ?? 0
        let thresVal3 = Double(thresField3.text!) ?? 0
        
        let defaults = UserDefaults.standard
        
        defaults.setValuesForKeys(["thres1":thresVal1, "thres2":thresVal2, "thres3":thresVal3  ])
        defaults.synchronize()


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
