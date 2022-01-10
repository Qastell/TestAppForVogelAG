//
//  UIView+Ext.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
    
    func constraintBounds(to view: UIView? = nil,
                          insets: UIEdgeInsets? = nil) {
        guard let secondView = view ?? superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: secondView.topAnchor, constant: insets?.top ?? 0),
            bottomAnchor.constraint(equalTo: secondView.bottomAnchor, constant: insets?.bottom ?? 0),
            leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: insets?.left ?? 0),
            trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: insets?.right ?? 0)
        ])
    }
    
    func setCenter(to view: UIView? = nil) {
        guard let secondView = view ?? superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
            centerXAnchor.constraint(equalTo: secondView.centerXAnchor)
        ])
    }
    
    func setSize(_ size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size.height),
            widthAnchor.constraint(equalToConstant: size.width)
        ])
    }
}
