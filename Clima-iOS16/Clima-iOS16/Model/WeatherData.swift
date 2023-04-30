//
//  WeatherData.swift
//  Clima-iOS16
//
//  Created by Amr Mohamad on 30/04/2023.
//

import Foundation


struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main : Codable{
    let temp: Double
}

struct Weather : Codable {
    let description: String
    let id: Int
}
