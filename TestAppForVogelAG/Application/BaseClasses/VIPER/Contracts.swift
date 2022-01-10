//
//  Contracts.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

protocol PresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

extension PresenterProtocol {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}

protocol RouterProtocol: AnyObject {
    func dismiss(animated: Bool, completion: Action?)
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
}
