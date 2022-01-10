//
//  TableCell.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

class TableCell<T: CellIdentifiable>: UITableViewCell {
    
    var cellModel: T? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() { }
}
