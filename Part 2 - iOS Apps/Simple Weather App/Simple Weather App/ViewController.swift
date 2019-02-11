//
//  ViewController.swift
//  Simple Weather App

//

// Goal: search for weather based on city name and we want to retrieve data for today and tomorrow. We then want to display the date, city info (name and country), weather icon, current, min, and max temperatures
// 1) Make the API call based on URL and store any incoming data:
    // Format the URL correctly
    // Send out request for the data
    // Retrieve incoming data and store it, or print some error message
// 2) Parse the retrieved data and store the correct values
    // Get current date (and tomorrows) and display this
    // Separate and store the data into separate structs
// 3) Manipulate data into correct formats
    // Determine which data points we actually want
    // Calculate the values that we want
    // Store the values in objects (might need a separate class for this)
// 4) Displaying the data in the correct labels (display icon which will take another API call)
    // Retrieve the values and displaying them in the correct labels
    // Retrieve icon image and display it in the imageView

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityInfoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var minMaxTemperatureLabel: UILabel!
    
    var weatherDataHandler : WeatherDataHandler!
    var currentDay : Day = .today
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateLabel.text = DateHandler.todaysDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endEditingTextField(_ sender: UITextField) {
        let baseURLString = "http://api.openweathermap.org/data/2.5/forecast?q="
        let APIKeyString = "&appid=97326567e425146674d28a4530b670e2"
        guard let cityString = sender.text else { return }
        if let finalURL = URL(string: baseURLString + cityString + APIKeyString) {
            requestWeatherData(url: finalURL)
        } else {
            print("Malformed URL")
        }
    }
    
    func requestWeatherData(url : URL) {
        let task = URLSession.shared.dataTask(with: url) {
            (data,response,error) in
            if let urlResponse = response {
                print(urlResponse)
            }
            if let errorResponse = error {
                print(errorResponse)
            } else if let dataResponse = data {
                self.weatherDataHandler = WeatherDataHandler(_data: dataResponse)
                self.weatherDataHandler.decodeData()
                
                let delay = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: delay, execute: {
                    self.displayWeatherData()
                })
            }
        }
        task.resume()
        
    }
    
    func displayWeatherData() {
        guard let weatherDataHandle = weatherDataHandler else { return }
        if let city = weatherDataHandle.cityString {
            self.cityInfoLabel.text = city
        }
        
        var day: WeatherByDay?
        switch self.currentDay {
        case .today:
            day = weatherDataHandle.todaysData
            dateLabel.text = DateHandler.todaysDate
        case .tomorrow:
            day = weatherDataHandle.tomorrowsData
            dateLabel.text = DateHandler.tomorrowsDate
        }
        if let currentDay = day {
            temperatureLabel.text = "\(currentDay.averageTemp)℃"
            minMaxTemperatureLabel.text = "Min: \(currentDay.averageMinTemp)℃, Max: \(currentDay.averageMaxTemp)℃"
            getWeatherIcon(iconString: currentDay.iconString)
        } else {
            temperatureLabel.text = "No data to display"
            minMaxTemperatureLabel.text = "No data to display"
        }
    }
    
    func getWeatherIcon(iconString: String) {
        let baseURLString = "http://openweathermap.org/img/w/"
        let endURLString = ".png"
        guard let iconURL = URL(string: baseURLString + iconString + endURLString) else { return }
        let task = URLSession.shared.dataTask(with: iconURL) {
            (data,response,error) in
            if let urlResponse = response {
                print(urlResponse)
            }
            if let errorResponse = error {
                print(errorResponse)
            } else if let dataResponse = data {
                let delay = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: delay, execute: {
                    self.displayIconImage(data: dataResponse)
                })
            }
        }
        task.resume()
    }
    
    func displayIconImage(data: Data) {
        if let image = UIImage(data: data) {
            self.imageView.image = image
        } else {
            print("Could not convert image")
        }
    }
    
    @IBAction func pressTodayButton(_ sender: UIBarButtonItem) {
        currentDay = .today
        displayWeatherData()
    }
    
    @IBAction func pressTomorrowButton(_ sender: UIBarButtonItem) {
        currentDay = .tomorrow
        displayWeatherData()
    }
    
}

