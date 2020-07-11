//
//  CoordinatorProtocol.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    func showWeatherView()
    func navigateToWeatherDetail()
}
