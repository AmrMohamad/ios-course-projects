//
//  WeatherManager.swift
//  Clima-iOS16
//
//  Created by Amr Mohamad on 28/04/2023.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if let safeData = data{
                    if let weather = self.parseJSON(weatherData: safeData){
                        print(weather.conditionId)
                        print(weather.cityName)
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON (weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            return WeatherModel(conditionId: id, cityName: name, temperature: temp)
        } catch {
            print(error)
            return nil
        }
    }
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
}
