//
//  Router.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

class Router: NSObject, RouterProtocol {
    
    var viewController: UIViewController?
    
    func dismiss(animated: Bool, completion: Action?) {
        DispatchQueue.main.async {
            self.viewController?.dismiss(animated: animated, completion: completion)
        }
    }
    
    func pop(animated: Bool) {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popViewController(animated: animated)
        }
    }
    
    func popToRoot(animated: Bool) {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popToRootViewController(animated: animated)
        }
    }
    
    func present(_ viewController: UIViewController, animated: Bool, completion: Action?) {
        self.viewController?.present(viewController, animated: animated, completion: completion)
    }
    
    func push(to viewController: UIViewController, animated: Bool) {
        self.viewController?.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func setRoot(viewController: UIViewController, animated: Bool) {
        self.viewController?.navigationController?.setViewControllers([viewController], animated: true)
    }
}
