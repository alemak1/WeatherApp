//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 4/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.


import UIKit
import Foundation


class ViewController: UIViewController {
    
    private let forecastAPIKey: String = "ee1cc0493ff35cc8dc97394f1fcb0348"
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseURL = NSURL(string: "https://api.darksky.net/forecast/\(forecastAPIKey)/")
        let forecastURL = NSURL(string: "37.8267,-122.4233", relativeToURL: baseURL as URL?)

        let icon = WeatherIcon.PartlyCloudyDay.image
        let currentWeather = CurrentWeather(temperature: 56.0, humidity: 1.0, precipitationProbability: 1.0, summary: "Wet and Rainy", icon: icon)
        
        displayCurrentWeather(weather: currentWeather)
    }
    
    
    func displayCurrentWeather(weather: CurrentWeather){
        currentTemperatureLabel.text = weather.temperatureString
        currentHumidityLabel.text = weather.humidityString
        currentPrecipitationLabel.text = weather.precipitationProbabilityString
        currentSummaryLabel.text = weather.summary
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension CurrentWeather{
    
    var humidityString: String{
        let percentageValue = Int(humidity*100)
        return "\(percentageValue) %"
    }
    
    var precipitationProbabilityString: String{
        let percentageValue = Int(precipitationProbability*100)
        return "\(percentageValue) %"
    }
    
    var temperatureString: String{
        let temperatureValue = Int(temperature)
        return "\(temperatureValue)º"
    }
    
    
    
}


