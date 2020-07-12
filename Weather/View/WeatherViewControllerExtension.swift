//
//  WeatherViewControllerExtension.swift
//  Weather
//
//  Created by Gaston Daniel Gabriel Grippi on 12/07/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//
import UIKit

//MARK: Weather UITableViewDelegate
extension WeatherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: weatherTable.frame.width, height: 40))
        titleView.backgroundColor = k.WeatherSection.BackgroundColor
        
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 0, width: titleView.frame.width - 10, height: 40))
        titleLabel.text = section == 0 ? k.WeatherSection.Titles.CurrentCity : k.WeatherSection.Titles.OtherCities
        
        titleView.addSubview(titleLabel)
        
        return titleView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cityID:Int?
        if (indexPath.section == 0) {
            cityID = presenter?.getCityID(index:indexPath.row)
        } else {
            cityID = presenter?.getCityID(index:indexPath.row+1)
        }
        coordinator?.navigateToWeatherDetail(cityID: cityID)
    }
}


//MARK: Weather UITableViewDataSource
extension WeatherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = presenter?.getCitiesCount(), count != 0 else {
            return 0
        }
        switch section {
        case 0:
            return 1
        default:
            return count-1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: k.identifiers.WeatherCell)
        cell = UITableViewCell(style: .value1, reuseIdentifier: k.identifiers.WeatherCell)
        
        if (indexPath.section == 0) {
            cell?.textLabel?.text = presenter?.getCityName(index: indexPath.row)
            cell?.detailTextLabel?.text = presenter?.getCityTemperature(index: indexPath.row)
        } else {
            cell?.textLabel?.text = presenter?.getCityName(index: indexPath.row+1)
            cell?.detailTextLabel?.text = presenter?.getCityTemperature(index: indexPath.row+1)
        }
        return cell!
    }

}
