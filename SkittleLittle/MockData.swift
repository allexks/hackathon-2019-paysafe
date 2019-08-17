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
                                                 image: UIImage(named: "food-category")!,
                                                 defaultBudgetType: .needs,
                                                 transactionType: .outcome)
    
    static var categorySalary = Category(name: "Salary", image: UIImage(named: "cash-category")!, defaultBudgetType: .none, transactionType: .income)
    
    static var k0p0nCategory = Category(name: "Entertainment", image: UIImage(named: "k0p0n-category")!, defaultBudgetType: .wants, transactionType: .outcome)
    
    static var stocksCategory = Category(name: "Stocks", image: UIImage(named: "credit-card-category")!, defaultBudgetType: .investments, transactionType: .outcome)
    
    static var person1 = Person(name: "Gosho", pic: UIImage(named: "antoni")!)
    
    static var person2 = Person(name: "Pesho", pic: UIImage(named: "alex")!)
    
    static var person3 = Person(name: "Stamat", pic: UIImage(named: "pidal")!)
    
    static var transaction1 = Transaction(datetime: Date(),
                                          category: MockData.categorySalary,
                                         budgetType: .none,
                                         value: 4500,
                                         transactionType: .income,
                                         recurrence: .monthly,
                                         people: [],
                                         hasPaid: [])
    
    static var transaction8 = Transaction(datetime: Date(),
     category: MockData.catergoryFoodAndDrinks,
    budgetType: .needs,
    value: 5,
    transactionType: .income,
    recurrence: .daily,
    people: [person2],
    hasPaid: [false])
    
    static var transaction2 = Transaction(datetime: Date().addingTimeInterval(TimeInterval(86400)),
                                          category: catergoryFoodAndDrinks,
                                          budgetType: .needs,
                                          value: 10,
                                          transactionType: .outcome,
                                          recurrence: .daily,
                                          people: [person1, person2],
                                          hasPaid: [false, true])
    
    static var transaction3 = Transaction(datetime: Date().addingTimeInterval(TimeInterval(4*172800)),
                                          category: MockData.k0p0nCategory,
                                          budgetType: .wants,
                                          value: 100,
                                          transactionType: .outcome,
                                          recurrence: .weekly,
                                          people: [person1, person2, person3],
                                          hasPaid: [false, true, false])
    
    static var transaction4 = Transaction(datetime: Date().addingTimeInterval(TimeInterval(2*86400)),
    category: catergoryFoodAndDrinks,
    budgetType: .needs,
    value: 15,
    transactionType: .outcome,
    recurrence: .daily,
    people: [person1, person2],
    hasPaid: [true, false])
    
    static var transaction5 = Transaction(datetime: Date().addingTimeInterval(TimeInterval(3*86400)),
    category: catergoryFoodAndDrinks,
    budgetType: .needs,
    value: 10,
    transactionType: .outcome,
    recurrence: .daily,
    people: [person1, person2],
    hasPaid: [false, false])
    
    static var transaction6 = Transaction(datetime: Date().addingTimeInterval(TimeInterval(31*86400)),
     category: MockData.categorySalary,
    budgetType: .none,
    value: 4500,
    transactionType: .income,
    recurrence: .monthly,
    people: [],
    hasPaid: [])
    
    static var transaction7 = Transaction(datetime: Date().addingTimeInterval(TimeInterval(4*86400)),
                                          category: MockData.stocksCategory,
    budgetType: .investments,
    value: 2048,
    transactionType: .outcome,
    recurrence: .never,
    people: [person1],
    hasPaid: [false])
    
    static var achievement1 = Achivement(name: "Invester", isLocked: false, currentLevel: 1, conditions: "complete at least 30% INVESTMENTS", badge: UIImage(named: "invester")!)
    static var achievement2 = Achivement(name: "Turbo Invester", isLocked: true, currentLevel: 0, conditions: "complete at least 50% INVESTMENTS", badge: UIImage(named: "turboinvest")!)
    static var achievement3 = Achivement(name: "Big Spender", isLocked: false, currentLevel: 3, conditions: "complete at least 50% WANTS", badge: UIImage(named: "bigspender")!)
    static var achievement4 = Achivement(name: "Needy Boii", isLocked: false, currentLevel: 1, conditions: "complete at least 50% NEEDS", badge: UIImage(named: "needs")!)
    static var achievement5 = Achivement(name: "Perfect Balance", isLocked: true, currentLevel: 0, conditions: "complete at least 30% ALL", badge: UIImage(named: "balance")!)
}
