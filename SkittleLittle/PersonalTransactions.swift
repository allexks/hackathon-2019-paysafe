//
//  PersonalTransactions.swift
//  SkittleLittle
//
//  Created by Aleksandar Ignatov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import Foundation

class PersonalTransactions {
    var transactions: [Transaction]
    
    init(transactions: [Transaction] = []) {
        self.transactions = transactions
    }
}
