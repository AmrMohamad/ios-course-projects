//
//  WeatherUI.swift
//  Clima-UIKit-iOS16
//
//  Created by Amr Mohamad on 24/04/2023.
//

import UIKit

class WeatherUI {
    
    let bGImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let locationButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.tintColor = .label
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return button
    }()
    
    let searchTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder     = "Search"
        tf.textAlignment   = .right
        tf.font            = UIFont.systemFont(ofSize: 25, weight: .regular)
        tf.minimumFontSize = 12
        tf.backgroundColor = .systemFill
        tf.borderStyle     = .roundedRect
        tf.autocapitalizationType = .words
        tf.returnKeyType = .go
        return tf
    }()
    
    let searchButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .label
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return button
    }()
    
    let conditionImage : UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "sun.max"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .label
        return image
    }()
    
    let dgreeSignLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "°C"
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.textAlignment = .right
        return label
    }()
    
    let dgreeValueLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21"
        label.font = UIFont.systemFont(ofSize: 80, weight: .black)
        label.textAlignment = .right
        return label
    }()
    
    let cityLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lodon"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        return label
    }()
}
