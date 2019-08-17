//
//  MockData.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit
import Foundation


class MockData {
    
    static var catergoryFoodAndDrinks = Category(name: "Food & Drinks",
                                                 image: UIImage(color: .green,
                                                                size: CGSize(width: 44,
                                                                             height: 44)),
                                                 defaultBudgetType: .needs,
                                                 transactionType: .outcome)
    
    static var person1 = Person(name: "Gosho", pic: UIImage(color: .red,
                                                            size: CGSize(width: 21,
                                                                         height: 21)))
    
    static var person2 = Person(name: "Pesho", pic: UIImage(color: .blue,
                                                            size: CGSize(width: 21,
                                                                         height: 21)))
    
    static var person3 = Person(name: "Stamat", pic: UIImage(color: .purple,
                                                             size: CGSize(width: 21,
                                                                          height: 21)))
    static var transaction1 = Transaction(datetime: Date(),
                                         category: catergoryFoodAndDrinks,
                                         budgetType: .needs,
                                         value: 4500,
                                         transactionType: .income,
                                         recurrence: .never,
                                         people: [person1, person2, person3],
                                         hasPaid: [false, false, true])
    
    static var transaction2 = Transaction(datetime: Date().addingTimeInterval(TimeInterval(86400)),
                                          category: catergoryFoodAndDrinks,
                                          budgetType: .needs,
                                          value: 1500,
                                          transactionType: .outcome,
                                          recurrence: .never,
                                          people: [person1, person2, person3],
                                          hasPaid: [true, true, true])
    
    static var transaction3 = Transaction(datetime: Date().addingTimeInterval(TimeInterval(172800)),
                                          category: catergoryFoodAndDrinks,
                                          budgetType: .needs,
                                          value: 7500,
                                          transactionType: .outcome,
                                          recurrence: .monthly,
                                          people: [person1, person2, person3],
                                          hasPaid: [false, false, false])

    
}
