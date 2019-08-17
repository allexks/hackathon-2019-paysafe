//
//  PersonalSettings.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import Foundation

struct PersonalSettings {
    static let shared = PersonalSettings()
    private init() {}

    var wants: Int = 0
    var needs: Int = 0
    var investments: Int = 0
    var initBalance: Double = 0
    var currentBalance: Double = 0
    var currency: String = "BGN"
    var period: Period = .month
}
