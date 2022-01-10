//
//  UITableView+Ext.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

typealias TableViewDelegates = UITableViewDelegate & UITableViewDataSource

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: cell.autoReuseIdentifier)
    }
    
    func dequeue<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.autoReuseIdentifier, for: indexPath) as? T
    }
    
    func cellForRow(at point: CGPoint) -> UITableViewCell? {
        if let indexPath = indexPathForRow(at: point),
           let cell = cellForRow(at: indexPath) {
            return cell
        }
        return nil
    }
    
    func cellForRow<T: UITableViewCell>(at point: CGPoint) -> T? {
        if let indexPath = indexPathForRow(at: point),
           let cell = cellForRow(at: indexPath) as? T {
            return cell
        }
        return nil
    }
    
    func reloadDataAnimated() {
        reloadData()
        let animation = CATransition()
        animation.type = CATransitionType.fade
        animation.subtype = CATransitionSubtype.fromBottom
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.duration = 0.2
        layer.add(animation, forKey: "UITableViewReloadDataAnimationKey")
    }
    
}
