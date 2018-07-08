//
//  ApiController.swift
//  RootAR
//
//  Created by Nicholas Erasmus on 2018/07/08.
//  Copyright © 2018 CompanyName. All rights reserved.
//

import Foundation

class ApiController {
    struct Post: Codable {
        let action: String
        let object: String
    }
    
    func submitPost(post: Post) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "87e2b75e.ngrok.io"
        urlComponents.path = "/"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        // Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        // Encode Post struct into JSON
        let encoder = JSONEncoder()
        
        let jsonData = try! encoder.encode(post)
        // Set HTTP body
        request.httpBody = jsonData
        print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        
        // POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                return
            }
            
            // APIs usually respond with the data you just sent in your POST request
            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                print("response: ", utf8Representation)
            } else {
                print("no readable data received in response")
            }
        }
        task.resume()
    }
}
