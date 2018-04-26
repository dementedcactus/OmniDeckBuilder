//
//  ImageAPIHelper.swift
//  OmniDeckBuilder
//
//  Created by Richard Crichlow on 4/26/18.
//  Copyright © 2018 Richard Crichlow. All rights reserved.
//

import Foundation
import UIKit



class ImageAPIClient {
    private init() {}
    static let manager = ImageAPIClient()
    func getImage(from urlStr: String,
                  completionHandler: @escaping (UIImage) -> Void,
                  errorHandler: @escaping (AppError) -> Void) {
        guard let url = URL(string: urlStr) else {
            errorHandler(.invalidImage)
            return
        }
        let urlRequest = URLRequest(url: url)
        let completion: (Data) -> Void = {(data: Data) in
            guard let onlineImage = UIImage(data: data) else {
                return
            }
            completionHandler(onlineImage)
        }
        NetworkHelper.manager.performDataTask(with: urlRequest, completionHandler: completion, errorHandler: errorHandler)
    }
}
