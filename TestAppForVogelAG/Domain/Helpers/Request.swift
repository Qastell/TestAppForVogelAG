//
//  Request.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation

enum Request {
    case searchBooks(text: String)
    
    var path: String {
        switch self {
        case .searchBooks(let text):
            return "volumes?q=\(text)"
        }
    }
}
