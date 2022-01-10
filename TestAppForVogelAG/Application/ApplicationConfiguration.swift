//
//  ApplicationConfiguration.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 11.01.2022.
//

import Foundation
import UIKit

enum ApplicationConfiguration {
    
    private static var host: String {
        "https://www.googleapis.com"
    }
    
    private static var api: String {
        "/books/v1/"
    }
    
    static var serverURL: String {
        host + api
    }
    
}
