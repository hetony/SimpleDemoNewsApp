//
//  ApiService.swift
//  SimpleNewsApp
//
//  Created by Vijesh on 03/07/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

class ApiService: NSObject {
    
    static let sharedManager = ApiService()
    
    func startApiService(_ url: String?, success:@escaping (Data) -> Void, failure:@escaping (String?) -> Void) {
        
        guard let urlwithPercentEscapes = url?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
            failure("Some error occured. Please try again later")
            return
        }
        
        guard let urlEndPoint = URL(string: urlwithPercentEscapes) else {
            failure("Some error occured. Please try again later")
            return
        }
        
        print(urlwithPercentEscapes)
        
        var urlRequest = URLRequest(
            url: urlEndPoint,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 15)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                failure(error?.localizedDescription)
                return
            }
            
            guard let urlData = data else {
                failure("Some error occured. Please try again later")
                return
            }
            
            //call success block from the main queue
            DispatchQueue.main.async {
                success(urlData)
            }
            
        }.resume()
    }
    
    
}
