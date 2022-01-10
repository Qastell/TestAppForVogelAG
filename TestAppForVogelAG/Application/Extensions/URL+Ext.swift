//
//  URL+Ext.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 11.01.2022.
//

import Foundation
import UIKit

extension URL {
    var withHTTPSScheme: URL? {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
        urlComponents?.scheme = "https"
        return urlComponents?.url
    }
}
