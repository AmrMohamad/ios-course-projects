//
//  WeatherData.swift
//  Clima-UIKit-iOS16
//
//  Created by Amr Mohamad on 30/04/2023.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main : Decodable{
    let temp: Double
}

struct Weather : Decodable {
    let description: String
    let id: Int
}
