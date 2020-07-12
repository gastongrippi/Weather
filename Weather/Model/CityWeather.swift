//
//  CityWeather.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

struct CityWeather: Codable {
    //MARK: Properties
    var cityName: String
    var temperature: Float
    
    enum CodingKeys: String, CodingKey {
        case cityName = "name"
        case temperature = "main"
    }
    
    enum temperatureKeys: String, CodingKey {
        case temp
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cityName = try values.decode(String.self, forKey: .cityName)
        let tempContainer = try values.nestedContainer(keyedBy: temperatureKeys.self, forKey: .temperature)
        temperature = try tempContainer.decode(Float.self, forKey: .temp)
    }
}
