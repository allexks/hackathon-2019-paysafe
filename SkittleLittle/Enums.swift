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

enum BudgetType {
    case none
    case needs
    case wants
    case investments
}

enum RecurrenceType {
    case never
    case daily
    case weekly
    case biweekly
    case monthly
    case yearly
    case oncePerPeriod
}

enum Period {
    case month
    case week
    case day
    case year
}
