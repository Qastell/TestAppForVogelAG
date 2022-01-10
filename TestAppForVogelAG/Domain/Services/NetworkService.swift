//
//  NetworkService.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit

class NetworkService {
    let urlSession = URLSession.shared
    
    func execute<T: Codable>(type: Request,
                             method: MethodType = .get,
                             parameters: [String : Any]? = nil,
                             completion: @escaping (Result<T, Error>) -> Void)  {
        guard let url = URL(string: ApplicationConfiguration.serverURL + type.path) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let parameters = parameters {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
            request.httpBody = httpBody
        }
        
        DispatchQueue.global(qos: .utility).async {
            self.urlSession.dataTask(with: request) { data, response, error in
                print("url: \(url)\n[RESPONSE]: \(String(describing: response))")
                
                if let error = error {
                    print("url: \(url)\n[ERROR]: \(String(describing: error))")
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else { return }
                
                print("url: \(url)\n[DATA]: \(String(data: data, encoding: .utf8))")
                
                do {
                    let value = try JSONDecoder().decode(T.self, from: data)
                    print("url: \(url)\n[VALUE]: \(String(describing: value))")
                    completion(.success(value))
                    
                } catch let jsonError {
                    print("url: \(url)\n[ERROR]: \(String(describing: jsonError))")
                    completion(.failure(jsonError))
                }
            }.resume()
        }
    }
}

extension NetworkService {
    enum MethodType: String {
        case get = "GET"
        case post = "POST"
    }
}
