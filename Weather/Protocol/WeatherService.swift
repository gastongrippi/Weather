//
//  WeatherService.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//
import Alamofire

class WeahterService: WeatherServiceProtocol {
    func getCurrentWeather(endpoint: String, completion: @escaping ((Data) -> Void)) {
        AF.request(endpoint,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding(options:.prettyPrinted),
                          headers: nil).validate().responseJSON { (DefaultDataResponse) in
                            print(DefaultDataResponse)
                            
                            switch DefaultDataResponse.result {
                            case .success: break
                                
                            case .failure(let error):
                                print(error)
                                return
                            }
                            if let data = DefaultDataResponse.data {
                                completion(data)
                            }
        }
    }
}
