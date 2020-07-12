//
//  CoordinatorProtocol.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {
    //MARK: Properties
    var navigationController: UINavigationController { get set }
    
    //MARK: Methods
    func showWeatherView()
    func navigateToWeatherDetail(cityID: Int?)
}
