//
//  SearchModuleAssembly.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit

enum SearchModuleAssembly {
    
    static func create() -> SearchModuleViewController {
        let view = SearchModuleViewController()
        let presenter = SearchModulePresenter()
        
        let router = SearchModuleRouter()
        router.viewController = view
        
        presenter.view = view
        presenter.router = router
        
        view._presenter = presenter
        return view
    }
    
}
