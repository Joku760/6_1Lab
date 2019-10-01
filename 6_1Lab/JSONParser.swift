//
//  JSONParser.swift
//  6_1Lab
//
//  Created by Ilari Marjamaa on 01/10/2019.
//  Copyright © 2019 Ilari Marjamaa. All rights reserved.
//

import UIKit

class JSONParser: NSObject {
    
    func getDatTempPls(urlest : String){
        if let url = URL(string: urlest) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print(jsonString)
                    }
                }
            }.resume()
        }
    }
}
