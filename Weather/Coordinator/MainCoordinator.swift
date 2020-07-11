//
//  MainCoordinator.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showWeatherView() {
        let vc = WeatherViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToWeatherDetail() {
        
    }
}
