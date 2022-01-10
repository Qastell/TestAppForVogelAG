//
//  BookInfoResponseModel.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

struct BookInfoResponseModel: Codable {
    
    var title: String?
    var authors: [String]?
    var description: String?
    var imageLinks: BookImageResponse?
    
}
