//
//  SearchModuleViewController.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit

protocol SearchModuleViewControllerProtocol: AnyObject {
    func reloadTableView(_ rows: [CellModel])
    func endEditing()
}

class SearchModuleViewController: ViewController {
    
    fileprivate var presenter: SearchModulePresenterProtocol? {
        guard let presenter = self._presenter as? SearchModulePresenterProtocol else { return nil }
        return presenter
    }
    
    private let customView = SearchModuleView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        customView.delegate = self
    }
    
    override func configureNavigationBar() {
        super.configureNavigationBar()
        navigationItem.title = "Search books"
    }
    
}

// MARK: - SearchModuleViewControllerProtocol
extension SearchModuleViewController: SearchModuleViewControllerProtocol {
    
    func reloadTableView(_ rows: [CellModel]) {
        customView.reloadTableView(rows)
    }
    
    func endEditing() {
        customView.endEditing()
    }
    
}

// MARK: - SearchModuleViewDelegate
extension SearchModuleViewController: SearchModuleViewDelegate {
    
    func didChangeSearchText(_ text: String) {
        presenter?.didChangeSearchText(text)
    }
    
    func searchBarTextDidBeginEditing() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func searchBarTextDidEndEditing() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
