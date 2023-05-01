//
//  WeatherViewController.swift
//  Clima-iOS16
//
//  Created by Amr Mohamad on 23/04/2023.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var tempValueLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
        weatherManager.delegate = self
    }

    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        weatherManager.fetchWeather(cityName: searchTextField.text!)
//        print(searchTextField.text!)
        searchTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        weatherManager.fetchWeather(cityName: searchTextField.text!)
//        print(searchTextField.text!)
        searchTextField.text = ""
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Someting ..."
            return false
        }
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager ,weather: WeatherModel) {
        DispatchQueue.main.async {
            self.tempValueLabel.text      = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text           = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}

