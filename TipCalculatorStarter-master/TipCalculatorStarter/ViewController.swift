//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Chase Wang on 9/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBOutlet weak var inputCardView: UIView!
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var outputCardView: UIView!
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        billAmountTextField.calculateButtonAction = {
            
            // dismiss keyboard if it's displayed
            if self.billAmountTextField.isFirstResponder {
            self.billAmountTextField.resignFirstResponder()
            }
            // 1
            guard let billAmountText = self.billAmountTextField.text,
                let billAmount = Double(billAmountText) else {
                    return
            }
            //round to 2 decimals
            let roundedBillAmount = (100 * billAmount).rounded() / 100
            
            //tip percent
            let tipPercent = 0.15
            let tipAmount = roundedBillAmount * tipPercent
            let roundedTipAmount = (100 * tipAmount).rounded() / 100
            
            //add them together
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            // Update UI
            self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
            self.tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
            self.totalAmountLabel.text = String(format: "%.2f", totalAmount)

        }
    }
    
    @IBAction func themeToggled(_ sender: UISwitch) {
        if sender.isOn{
            print("switch toggled on")
        } else {
            print("switch toggled off")
        }
    }
    
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("reset button tapped")
    }
}

