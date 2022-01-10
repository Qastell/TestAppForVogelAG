//
//  DetailModuleViewController.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 11.01.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit

protocol DetailModuleViewControllerProtocol: AnyObject {
    func setupView(with book: BookResponseModel)
}

class DetailModuleViewController: ViewController {
    
    fileprivate var presenter: DetailModulePresenterProtocol? {
        guard let presenter = self._presenter as? DetailModulePresenterProtocol else { return nil }
        return presenter
    }
    
    private let customView = DetailModuleView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
    }
    
    override func configureNavigationBar() {
        super.configureNavigationBar()
        navigationItem.title = "Book's Details"
    }
    
}

// MARK: - DetailModuleViewControllerProtocol
extension DetailModuleViewController: DetailModuleViewControllerProtocol {
    
    func setupView(with book: BookResponseModel) {
        customView.setupView(with: book)
    }
    
}

// MARK: - DetailModuleViewDelegate
extension DetailModuleViewController: DetailModuleViewDelegate { }
