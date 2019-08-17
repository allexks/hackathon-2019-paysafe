//
//  SecondScreenViewController.swift
//  SkittleLittle
//
//  Created by Aleksandar Ignatov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {

    @IBOutlet weak var currencyField: UITextField!
    @IBOutlet weak var balanceField: UITextField!
    @IBOutlet weak var periodPicker: UIPickerView!
    
    let personalSettings = PersonalSettings.shared
    
    var pickerIsVisible = false {
        didSet {
            periodPicker.isHidden = !pickerIsVisible
        }
    }
    
    var periodPickerData: [String] {
        return Period.allCases.map { $0.rawValue }
    }
    
    var currency: String {
        return currencyField.text ?? ""
    }
    
    var balance: Double {
        return Double(balanceField.text ?? "") ?? 0.0
    }
    
    var period: Period = .month
    
    override func viewDidLoad() {
        super.viewDidLoad()

        periodPicker.delegate = self
        periodPicker.dataSource = self
    }
    
    @IBAction func onTapDoneButton(_ sender: UIButton) {
        guard let window = UIApplication.shared.keyWindow else {
            fatalError("nimoish kodish we bonak")
        }
        
        personalSettings.currency = currency
        personalSettings.initBalance = balance
        personalSettings.currentBalance = balance
        personalSettings.period = period
        
        let mainTabBarViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeMainTabBar")
        window.rootViewController = mainTabBarViewController
        
    }
    
    @IBAction func onTouchPickButton(_ sender: UIButton) {
        if pickerIsVisible {
            pickerIsVisible = false
            sender.setTitle("Choose", for: .normal)
        } else {
            pickerIsVisible = true
            sender.setTitle("Done", for: .normal)
        }
    }
}

extension SecondScreenViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return periodPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return periodPickerData[row]
    }
}

extension SecondScreenViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        period = Period(rawValue: periodPickerData[row]) ?? .month
    }
}
