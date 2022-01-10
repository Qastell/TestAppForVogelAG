//
//  BookResponseModel.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

class BookResponseModel: Codable {
    
    var id: String?
    var volumeInfo: BookInfoResponseModel?
    
}
