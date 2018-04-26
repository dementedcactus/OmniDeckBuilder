//
//  NetworkHelper.swift
//  OmniDeckBuilder
//
//  Created by Richard Crichlow on 4/26/18.
//  Copyright © 2018 Richard Crichlow. All rights reserved.
//

import Foundation

public enum AppError: Error {
    case badURL(url: String)
    case badImageURL(url: String)
    case badData
    case badResponseCode(code: Int)
    case cannotParseJSON(rawError: Error)
    case noInternet
    case notAnImage
    case other(rawError: Error)
    case invalidImage
    case goodStatusCode(num: Int)
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case noDataReceived
    case codingError(rawError: Error)
    case badStatusCode(num: Int)
    case urlError(rawError: Error)
}

enum HTTPVerb: String {
    case GET
    case POST
}

class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    let urlSession = URLSession(configuration: .default)
    
    func performDataTask(with url: URLRequest, completionHandler: @escaping ((Data) -> Void), errorHandler: @escaping ((AppError) -> Void)) {
        
        self.urlSession.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                
                guard let data = data else {
                    errorHandler(AppError.noDataReceived)
                    return
                }
                if let response = response as? HTTPURLResponse {
                    errorHandler(AppError.goodStatusCode(num: response.statusCode))
                    //print(response.statusCode)
                    //return
                }
                if let error = error as? URLError {
                    switch error {
                    case URLError.notConnectedToInternet:
                        errorHandler(AppError.noInternetConnection)
                        return
                    default:
                        errorHandler(AppError.urlError(rawError: error))
                    }
                }
                if let error = error {
                    let error = error as NSError
                    if error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                        errorHandler(AppError.noInternetConnection)
                        return
                    }
                    else {
                        errorHandler(AppError.other(rawError: error))
                    }
                }
                //Optional (for printing data)
                if let dataStr = String(data: data, encoding: .utf8){
                    print(dataStr)
                }
                completionHandler(data)
            }
            }.resume()
    }
}
