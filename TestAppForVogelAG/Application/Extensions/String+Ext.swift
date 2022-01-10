//
//  String+Ext.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 11.01.2022.
//

import Foundation
import UIKit

extension String {
    
    static var randomLatinChar: String {
        "abcdefghijklmnopqrstuvwxyz".map { String($0) }.randomElement() ?? ""
    }
    
}
