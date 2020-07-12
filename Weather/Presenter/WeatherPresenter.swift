//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherPresenter: WeatherPresenterProtocol {
    
    //MARK: Properties
    var viewDelegate: WeatherViewProtocol?
    var service: WeatherServiceProtocol?
    var weatherList = [CityWeather]()
    
    
    // MARK: Initialize
    init(delegate: WeatherViewProtocol) {
        viewDelegate = delegate
        service = WeahterService()
    }
    
    //MARK: WeatherPresenterProtocol
    func loadCurrentWeather() {
        service?.getCurrentWeather(endpoint: k.API.CurrentWeatherEndpoint, completion: { [weakSelf = self] response in
            let jsonResult = JSON(response as Any)
            let jsonWeather = jsonResult["list"].arrayObject ?? []
            print(jsonWeather)
            
            for weather in jsonWeather {
                let jsonData = try? JSONSerialization.data(withJSONObject: weather, options: .prettyPrinted)
                if let weather = try? JSONDecoder().decode(CityWeather.self, from: jsonData!) {
                    print(weather)
                    weakSelf.weatherList.append(weather)
                }
            }
            weakSelf.viewDelegate?.reloadWeatherTable()
        })
    }
    
    func getCitiesCount() -> Int {
        return weatherList.count
    }
    
    func getCityName(index: Int) -> String {
        weatherList[index].cityName
    }
}
