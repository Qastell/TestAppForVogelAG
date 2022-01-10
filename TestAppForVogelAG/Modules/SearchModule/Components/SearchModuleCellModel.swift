//
//  SearchModuleCellModel.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation

class SearchModuleCellModel: CellModel {
    
    var action: Action?
    var model: BookResponseModel
    
    init(model: BookResponseModel) {
        self.model = model
    }
    
}
