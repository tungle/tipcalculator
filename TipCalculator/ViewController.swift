//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tung Le on 7/10/2016.
//  Copyright © 2016 Tung Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabel: UILabel!

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard

        loadSettings(defaults: defaults)
        
        
        tipControl.setTitle(String(format: "%d%", tipPercentages[0]), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%d%", tipPercentages[1]), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%d%", tipPercentages[2]), forSegmentAt: 2)

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

    @IBAction func onBillChanged(_ sender: AnyObject) {
        
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(tipPercentages[tipControl.selectedSegmentIndex])/100
        
        let total = bill + tip
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
        
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
}

