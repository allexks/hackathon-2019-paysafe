//
//  Achivement.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit

class Achivement {
    var name: String
    var isLocked: Bool
    var currentLevel: Int = 0
    var conditions: String
    var badge: UIImage
    
    init(name: String, isLocked: Bool, currentLevel: Int, conditions: String, badge: UIImage) {
        self.name = name
        self.isLocked = isLocked
        self.currentLevel = currentLevel
        self.conditions = conditions
        self.badge = badge
    }
}
