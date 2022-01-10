//
//  SearchModulePresenter.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit

protocol SearchModulePresenterProtocol: PresenterProtocol {
    func didChangeSearchText(_ text: String)
}

class SearchModulePresenter: Presenter {
    
    weak var view: SearchModuleViewControllerProtocol?
    var router: SearchModuleRouterInput?
    
    private lazy var searchService = SearchBookService()
    
    private var dispatchItem: DispatchWorkItem?
    
    private var bookModels: [BookResponseModel] = []
    
    func viewDidLoad() {
        startSearch(by: String.randomLatinChar)
    }
}

// MARK: - SearchModuleViewOutput
extension SearchModulePresenter: SearchModulePresenterProtocol {
    
    func didChangeSearchText(_ text: String) {
        if text.isEmpty { return }
        
        dispatchItem?.cancel()
        dispatchItem = DispatchWorkItem(block: { [weak self] in
            self?.startSearch(by: text)
        })
        if let dispatchItem = dispatchItem {
            DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + 0.5, execute: dispatchItem)
        }
    }
    
}

// MARK: - Private
private extension SearchModulePresenter {
    
    func startSearch(by text: String) {
        searchService.searchBooks(by: text) { [weak self] (result: Result<SearchBookResponseModel, Error>) in
            switch result {
            case .success(let value):
                self?.bookModels = value.items ?? []
                self?.makeRows()
            default: break
            }
        }
    }
    
    func makeRows() {
        let models = bookModels.compactMap { bookModel -> SearchModuleCellModel in
            let cellModel = SearchModuleCellModel(model: bookModel)
            cellModel.action = { [weak self] in
                self?.view?.endEditing()
                self?.router?.showDetail(of: bookModel)
            }
            return cellModel
        }
        
        view?.reloadTableView(models)
    }
    
}
