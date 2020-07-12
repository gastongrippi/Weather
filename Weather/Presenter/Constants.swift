//
//  Constants.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//
import UIKit

struct k {
    
    struct API {
        static let CurrentWeatherEndpoint = "https://api.openweathermap.org/data/2.5/group?id=\(CitiesIds)&units=metric&appid=\(Key)"
        static let CitiesIds = "\(Cities.Mendoza.rawValue),\(Cities.London.rawValue),\(Cities.Paris.rawValue),\(Cities.Moscow.rawValue),\(Cities.Santiago.rawValue),\(Cities.Tokyo.rawValue)"
        #warning("Provide your API key here")
        static let Key = "7432a7f9580b0dd4f475588c260f37f1"
    }
    
    struct ScrenTitles {
        static let WeatherListTitle = "Current Weather"
    }
    
    struct WeatherSection {
        static let BackgroundColor = UIColor.systemBlue
        struct Titles {
            static let CurrentCity = "Your City"
            static let OtherCities = "Other Cities"
        }
    }
    
    struct Constraints {
    }
    
    struct identifiers {
        static let WeatherCell = "weatherCell"
    }

    enum Cities: Int {
        case Mendoza = 3844421
        case London = 4119617
        case Paris = 2968815
        case Moscow = 524894
        case Santiago = 3871336
        case Tokyo = 1850147
    }
    
}
