//
//  WeatherServiceProtocol.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

protocol WeatherServiceProtocol {
    //MARK: Methods
    func getCurrentWeather(endpoint: String, completion: @escaping ((Data) -> Void))
}
