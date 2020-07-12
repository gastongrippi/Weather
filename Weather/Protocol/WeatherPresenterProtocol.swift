//
//  WeatherPresenterProtocol.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

protocol WeatherPresenterProtocol {
    //MARK: Methods
    func loadCurrentWeather()
    func getCitiesCount() -> Int
    func getCityName(index: Int) -> String
    func getCityTemperature(index: Int) -> String
    func getCityID(index: Int) -> Int
}
