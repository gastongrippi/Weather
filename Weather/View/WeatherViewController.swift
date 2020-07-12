//
//  ViewController.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 11/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    //MARK: Properties
    weak var coordinator: MainCoordinator?
    var presenter: WeatherPresenterProtocol?
    var weatherTable = UITableView(frame: .zero)

    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = k.ScrenTitles.WeatherListTitle
        weatherTable.register(UITableViewCell.self, forCellReuseIdentifier: k.identifiers.WeatherCell)
        setDelegates()
        setConstraints()
        presenter?.loadCurrentWeather()
    }
    
    
    //MARK: Private methods
    private func setDelegates() {
        presenter = WeatherPresenter(delegate: self)
        weatherTable.delegate = self
        weatherTable.dataSource = self
    }
    
    private func setConstraints() {
        view.addSubview(weatherTable)
        weatherTable.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
}

//MARK: WeatherViewProtocol
extension WeatherViewController: WeatherViewProtocol {
    func showSpinnerIndicator() {
        showSpinner(onView: self.view)
    }
    
    func hideSpinnerIndicator() {
        removeSpinner()
    }
    
    func reloadWeatherTable() {
        weatherTable.reloadData()
    }
}
