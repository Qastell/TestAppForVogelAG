//
//  UITableViewCell+Ext.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var autoReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
