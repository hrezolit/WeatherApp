//
//  CurrentWeather.swift
//  WheatherApp
//
//  Created by Nikita on 19/5/22.
//

import Foundation

struct CurrentWeather {
    
    let cityName: String
    let temperature: Double
    var temperatureString: String {
        return "\(String(format: "%.0f", temperature))ºC"
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return "Feels like \(feelsLikeTemperature.rounded())ºC"
    }
    
    let conditionCode: Int
    var systemIconWeatherString: String {
        switch conditionCode {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "smoke.fill"
        case 800:
            return "sun.min.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "nosign"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
