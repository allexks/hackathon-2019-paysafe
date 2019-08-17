
//
//  CategoryList.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import Foundation


class CategoryList {
    static let shared = CategoryList()
    private init() {}
    
    var categories: [Category] = []
}
