//
//  RequestHandler.swift
//  NYTestApp
//
//  Created by Manpreet Kaur on 19/06/19.
//  Copyright © 2019 Manpreet Kaur. All rights reserved.
//

import Foundation

class RequestHandler {
    
    func networkResult<T: Parsable>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
            
            return { dataResult in
                
                DispatchQueue.global(qos: .background).async(execute: {
                    switch dataResult {
                    case .success(let data) :
                        ParserHelper.parse(data: data, completion: completion)
                        break
                    case .failure(let error) :
                        print("Network error \(error)")
                        completion(.failure(.network(string: "Network error: " + error.localizedDescription)))
                        break
                    }
                })
                
            }
    }
}
