//
//  Transaction.swift
//  SkittleLittle
//
//  Created by Aleksandar Ignatov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import Foundation

struct Transaction {
    var datetime: Date
    var category: Category
    var budgetType: BudgetType
    var value: Int
    var transactionType: TransactionType
    var recurrence: RecurrenceType
    var people: [Person]
    var hasPaid: [Bool]
}
