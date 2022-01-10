//
//  SearchBookResponseModel.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

class SearchBookResponseModel: Codable {
    
    var totalItems: Int?
    var items: [BookResponseModel]?
    
}
