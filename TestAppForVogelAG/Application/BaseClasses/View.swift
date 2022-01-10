//
//  View.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

typealias TouchAction = (CGPoint) -> Void
typealias PanAction = (UIPanGestureRecognizer) -> Void
typealias Action = () -> Void

class View: UIView {
    
    private var tapAction: TouchAction?
    
    convenience init(color: UIColor) {
        self.init(frame: .zero)
        backgroundColor = color
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupView() {
    }
    
    @discardableResult
    func enableTap(_ action: @escaping TouchAction) -> UITapGestureRecognizer {
        tapAction = action
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
        return tapGesture
    }
    
    @objc
    private func didTap(_ gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: self)
        tapAction?(touchPoint)
    }
}
