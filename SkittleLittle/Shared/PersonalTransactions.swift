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
    
    var transactions: [Transaction] = [MockData.transaction1, MockData.transaction2,
                                       MockData.transaction3, MockData.transaction4,
                                       MockData.transaction5, MockData.transaction6,
                                       MockData.transaction7]
    
    var transactionsGroupedByDate: [Date : [Transaction]] {
        var transactionsByDate = [Date : [Transaction]]()
        
        transactions.forEach { (transaction) in
            
            if transactionsByDate[transaction.datetime] != nil {
               transactionsByDate[transaction.datetime]?.append(transaction)
            } else {
                transactionsByDate[transaction.datetime] = []
                transactionsByDate[transaction.datetime]?.append(transaction)
            }
        }
        
        return transactionsByDate
    }
}
