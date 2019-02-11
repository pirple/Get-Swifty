//
//  WeatherDataHandler.swift
//  Simple Weather App
//

import Foundation

class WeatherDataHandler {
    let data: Data
    var weatherJSONData: WeatherData?
    var cityString: String?
    var todaysData: WeatherByDay?
    var tomorrowsData: WeatherByDay?
    
    init(_data: Data) {
        self.data = _data
    }
    
    func decodeData() {
        let decoder = JSONDecoder()
        do {
            weatherJSONData = try decoder.decode(WeatherData.self, from: self.data)
            if let weatherData = weatherJSONData {
                cityString = weatherData.city.name + ", " + weatherData.city.country
                sortDataPointsByDay(weatherData: weatherData)
            }
            
        } catch {
            print(error)
        }
    }
    
    func sortDataPointsByDay(weatherData: WeatherData) {
        var todaysDataPoints = [WeatherDataPoint]()
        var tomorrowsDataPoints = [WeatherDataPoint]()
        for dataPoint in weatherData.list {
            var dateText = dataPoint.dt_txt
            let endIndex = dateText.index(dateText.startIndex, offsetBy: DateHandler.stringOffset)
            dateText = dateText.substring(to: endIndex)
            if dateText == DateHandler.todaysDate {
                todaysDataPoints.append(dataPoint)
            } else if dateText == DateHandler.tomorrowsDate {
                tomorrowsDataPoints.append(dataPoint)
            } else {
                break
            }
        }
        if !todaysDataPoints.isEmpty {
            todaysData = setWeatherByDate(date: DateHandler.todaysDate, dataPoints: todaysDataPoints)
        }
        if !tomorrowsDataPoints.isEmpty {
            tomorrowsData = setWeatherByDate(date: DateHandler.tomorrowsDate, dataPoints: tomorrowsDataPoints)
        }
        
        /*if todaysData != nil {
            print(todaysData!)
        }
        if tomorrowsData != nil {
            print(tomorrowsData!)
        }*/
    }
    
    func setWeatherByDate(date: String, dataPoints: [WeatherDataPoint]) -> WeatherByDay {
        let (averageTemp,minTemp,maxTemp) = calculateAverageTemperatures(dataPoints: dataPoints)
        let index = dataPoints.count / 2
        let iconString = dataPoints[index].weather.first?.icon.replacingOccurrences(of: "n", with: "d") ?? ""
        return WeatherByDay(date: date, averageTemp: averageTemp, averageMinTemp: minTemp, averageMaxTemp: maxTemp, iconString: iconString)
    }
    
    func calculateAverageTemperatures(dataPoints: [WeatherDataPoint]) -> (Double,Double,Double) {
        var averageTemp : Double = 0
        var minTemp : Double = (dataPoints.first?.main.temp_min)!
        var maxTemp : Double = (dataPoints.first?.main.temp_max)!
        let count = Double(dataPoints.count)
        
        for point in dataPoints {
            averageTemp += point.main.temp
            if point.main.temp_max > maxTemp {
                maxTemp = point.main.temp_max
            }
            if point.main.temp_min < minTemp {
                minTemp = point.main.temp_min
            }
        }
        averageTemp = round(10 * ((averageTemp / count) - 273.15)) / 10
        minTemp = round(10 * (minTemp - 273.15)) / 10
        maxTemp = round(10 * (maxTemp - 273.15)) / 10
        return (averageTemp,minTemp,maxTemp)
    }
}
