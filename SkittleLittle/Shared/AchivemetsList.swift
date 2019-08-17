//
//  AchivemetsList.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import Foundation

class AchivementsList {
    static let shared = AchivementsList()
    private init() {}
    
    var achivements: [Achivement] = []
}
