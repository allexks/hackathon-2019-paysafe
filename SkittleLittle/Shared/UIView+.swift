//
//  UIView+.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    func roundCorners(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
