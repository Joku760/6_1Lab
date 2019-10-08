//
//  JSONParser.swift
//  6_1Lab
//
//  Created by Ilari Marjamaa on 01/10/2019.
//  Copyright © 2019 Ilari Marjamaa. All rights reserved.
//

import UIKit

class JSONParser: NSObject {
    
    public var temperature = Double()
    public var currentWeather = String()
    public var iconID = String()
    
    struct Response: Codable {
        let weather: [Weather]
        let main: Main
        
        
        struct Weather: Codable {
            let main, icon: String
            
            enum CodingKeys: String, CodingKey {
                case main
                case icon
            }
        }
    }
    
    struct Main: Codable {
        let temp: Double
        
        enum CodingKeys: String, CodingKey {
            case temp
        }
    }
    
    
    func getDatTempPls(urlest : String){
        if let url = URL(string: urlest) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        self.temperature = res.main.temp
                        for Weather in res.weather {
                            self.currentWeather = Weather.main
                            self.iconID = Weather.icon
                        }
                        
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
