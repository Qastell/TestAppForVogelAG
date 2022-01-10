//
//  SearchModuleView.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit

protocol SearchModuleViewDelegate: AnyObject {
    func searchBarTextDidBeginEditing()
    func searchBarTextDidEndEditing()
    func didChangeSearchText(_ text: String)
}

class SearchModuleView: View {
    
    weak var delegate: SearchModuleViewDelegate?
    
    private var rowModels: [CellModel] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(SearchModuleTableCell.self)
        tableView.backgroundColor = .white
        tableView.separatorInset.left = 0
        return tableView
    }()
    
    private let whiteView = View(color: .white)
    
    private let searchBar = UISearchBar()
    
    func reloadTableView(_ rows: [CellModel]) {
        self.rowModels = rows 
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            if rows.isEmpty {
                strongSelf.tableView.reloadData()
            } else {
                strongSelf.tableView.reloadDataAnimated()
            }
        }
    }
    
    func endEditing() {
        searchBar.endEditing(true)
    }
    
    override func setupView() {
        super.setupView()
        backgroundColor = .white
        
        addSubview(tableView)
        addSubview(whiteView)
        
        tableView.constraintBounds()
        
        whiteView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(tableView.snp.top)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        searchBar.searchTextField.placeholder = "Search"
    }
    
}

extension SearchModuleView: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        delegate?.searchBarTextDidBeginEditing()
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        delegate?.searchBarTextDidEndEditing()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        endEditing()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.didChangeSearchText(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.didChangeSearchText(searchBar.text ?? "")
        endEditing()
    }
}

extension SearchModuleView: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        endEditing()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView.sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.addSubview(searchBar)
        view.backgroundColor = .clear
        
        searchBar.constraintBounds()
        searchBar.setSize(CGSize(width: SizeConstants.screenWidth,
                                 height: 56))
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(cell: SearchModuleTableCell.self, indexPath: indexPath),
              let cellModel = rowModels[safe: indexPath.row] as? SearchModuleCellModel else {
            return UITableViewCell()
        }
        
        cell.cellModel = cellModel
        
        return cell
    }
    
}
