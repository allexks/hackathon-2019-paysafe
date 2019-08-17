//
//  FirstScreenViewController.swift
//  SkittleLittle
//
//  Created by Aleksandar Ignatov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    @IBOutlet weak var needsField: UITextField!
    @IBOutlet weak var wantsField: UITextField!
    @IBOutlet weak var investmentsField: UITextField!
    
    let personalSettings = PersonalSettings.shared
    
    var needs: Int {
        return Int(needsField.text ?? "") ?? 0
    }
    
    var wants: Int {
        return Int(wantsField.text ?? "") ?? 0
    }
    
    var investments: Int {
        return Int(investmentsField.text ?? "") ?? 0
    }
    
    @IBAction func onTapDoneButton(_ sender: UIButton) {
        guard needs + wants + investments <= 100 else {
            print("sum is greater than 100 %") // TODO: use alert extension
            return
        }
        
        personalSettings.needs = needs
        personalSettings.wants = wants
        personalSettings.investments = investments
    }
}
