//
//  SecondScreenViewController.swift
//  SkittleLittle
//
//  Created by Aleksandar Ignatov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapDoneButton(_ sender: UIButton) {
        guard let window = UIApplication.shared.keyWindow else {
            fatalError("nimoish kodish we bonak")
        }
        let mainTabBarViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeMainTabBar")
        window.rootViewController = mainTabBarViewController
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
