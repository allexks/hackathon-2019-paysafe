//
//  Enums.swift
//  SkittleLittle
//
//  Created by Aleksandar Ignatov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import Foundation

enum TransactionType {
    case income
    case outcome
}

enum BudgetType: String {
    case none = ""
    case needs = "Needs"
    case wants = "Wants"
    case investments = "Investments"
}

enum RecurrenceType: String, CaseIterable {
    case never = "Never"
    case daily = "Daily"
    case weekly = "Weekly"
    case biweekly = "Biweekly"
    case monthly = "Monthly"
    case yearly = "Yearly"
    case oncePerPeriod = "OncePerPeriod"
}

enum Period: String, CaseIterable {
    case month = "Month"
    case week = "Week"
    case day = "Day"
    case year = "Year"
}
