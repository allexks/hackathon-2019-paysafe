//
//  PersonalTransactions.swift
//  SkittleLittle
//
//  Created by Aleksandar Ignatov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import Foundation

class PersonalTransactions {
    static let shared = PersonalTransactions()
    private init() {}
    
    var transactions: [Transaction] = []
}
