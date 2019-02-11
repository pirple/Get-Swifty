//
//  Weather Structures.swift
//  Simple Weather App

//

import Foundation

struct WeatherData : Codable {
    let list : [WeatherDataPoint]
    let city : City
}

struct City : Codable {
    let name : String
    let country : String
}

struct WeatherDataPoint : Codable {
    let main : Temperatures
    let dt_txt : String
    let weather : [WeatherIconData]
}

struct Temperatures : Codable {
    let temp : Double
    let temp_min : Double
    let temp_max : Double
}

struct WeatherIconData : Codable {
    let icon : String
}

struct WeatherByDay {
    let date: String
    let averageTemp: Double
    let averageMinTemp: Double
    let averageMaxTemp: Double
    let iconString: String
}

enum Day {
    case today
    case tomorrow
}
