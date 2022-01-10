//
//  SearchBookService.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

typealias SearchResponse = (Result<SearchBookResponseModel, Error>) -> Void

protocol SearchBookServiceInterface: AnyObject {
    func searchBooks(by text: String, completion: @escaping SearchResponse)
}

class SearchBookService: NetworkService, SearchBookServiceInterface {
    
    private lazy var networkService = NetworkService()
    
    func searchBooks(by text: String, completion: @escaping SearchResponse) {
        let request = Request.searchBooks(text: text)
        execute(type: request, completion: completion)
    }
    
}
