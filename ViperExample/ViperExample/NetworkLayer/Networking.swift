//
//  Networking.swift
//  ViperExample
//
//  Created by Merve on 17.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation


typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Void
typealias ErrorHandler = (String) -> Void

class NetworkLayer {
    
    static let genericError = "Generic Error"
    
    func get<T: Decodable>(urlString: String,
                           successHandler: @escaping (T) -> Void,
                           errorHandler: @escaping ErrorHandler) {
        
        let completionHandler: NetworkCompletionHandler = { (data,response,error) in
            
            if  error != nil {
                errorHandler(error?.localizedDescription ?? NetworkLayer.genericError)
                return
            }
            
            guard let data = data else {
                return errorHandler(NetworkLayer.genericError)
            }
            
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async{
                    successHandler(responseObject)
                    return
                }
                
            } catch let jsonError {
                DispatchQueue.main.async{
                    errorHandler(jsonError.localizedDescription)
                    return
                }
            }
        }
        
        guard let url = URL(string: urlString) else {
            return errorHandler("Generic Error")
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: (completionHandler))
        
        task.resume()
        
    }
}
