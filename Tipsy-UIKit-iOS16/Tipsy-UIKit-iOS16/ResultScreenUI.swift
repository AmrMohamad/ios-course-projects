//
//  ResultScreenUI.swift
//  Tipsy-UIKit-iOS16
//
//  Created by Amr Mohamad on 10/04/2023.
//

import UIKit

class ResultScreenUI {
    let resultValueView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "tipsy_color")
        return view
    }()
    
    let totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total per person"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    
    let totalPerPersonValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "56.32"
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let descriptionSettingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Split between 2 people, with 10% tip."
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recalculate", for: .normal)
        button.setTitleColor(.tertiarySystemBackground, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        button.layer.cornerRadius = 15
        return button
    }()
}
