//
//  SearchModuleRouter.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit

protocol SearchModuleRouterInput: RouterProtocol {
    func showDetail(of book: BookResponseModel) 
}

class SearchModuleRouter: Router, SearchModuleRouterInput {
    
    func showDetail(of book: BookResponseModel) {
        DispatchQueue.main.async {
            let module = DetailModuleAssembly.create(with: book)
            self.push(to: module, animated: true)
        }
    }
    
}
