//
//  DetailModuleAssembly.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 11.01.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit

enum DetailModuleAssembly {
    
    // Create and return controller
    static func create(with book: BookResponseModel) -> DetailModuleViewController {
        let view = DetailModuleViewController()
        let presenter = DetailModulePresenter(book: book)
        
        let router = DetailModuleRouter()
        router.viewController = view
        
        presenter.view = view
        presenter.router = router
        
        view._presenter = presenter
        return view
    }
    
}
