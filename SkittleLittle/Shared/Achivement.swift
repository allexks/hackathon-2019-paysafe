//
//  Achivement.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import Foundation

class Achivement {
    var name: String
    var isLocked: Bool
    var currentLevel: Int = 0
    
    init(name: String, isLocked: Bool, currentLevel: Int) {
        self.name = name
        self.isLocked = isLocked
        self.currentLevel = currentLevel
    }
}
