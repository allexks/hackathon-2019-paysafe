//
//  Category.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit
import Foundation

class Category {
    var name: String
    var image: UIImage // Fix later
    var defaultBudgetType: BudgetType
    var transactionType: TransactionType
    
    init(name: String, image: UIImage, defaultBudgetType: BudgetType, transactionType: TransactionType) {
        self.name = name
        self.image = image
        self.defaultBudgetType = defaultBudgetType
        self.transactionType = transactionType
    }
}
