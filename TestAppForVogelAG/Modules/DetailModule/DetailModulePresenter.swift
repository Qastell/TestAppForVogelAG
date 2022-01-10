//
//  DetailModulePresenter.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 11.01.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit

protocol DetailModulePresenterProtocol: PresenterProtocol { }

class DetailModulePresenter: Presenter {
    
    weak var view: DetailModuleViewControllerProtocol?
    var router: DetailModuleRouterInput?
    
    private let book: BookResponseModel
    
    init(book: BookResponseModel) {
        self.book = book
    }
    
    func viewDidLoad() {
        view?.setupView(with: book)
    }
    
}

// MARK: - DetailModuleViewOutput
extension DetailModulePresenter: DetailModulePresenterProtocol {
    
}
