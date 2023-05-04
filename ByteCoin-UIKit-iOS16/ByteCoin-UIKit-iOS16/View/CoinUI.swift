//
//  CoinUI.swift
//  ByteCoin-UIKit-iOS16
//
//  Created by Amr Mohamad on 04/05/2023.
//

import UIKit

class CoinUI{
    let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let byteCnLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text          = "ByteCoin"
        label.textColor     = UIColor(named: "Title Color")
        label.font          = UIFont.systemFont(ofSize: 50, weight: .thin)
        label.textAlignment = .center
        return label
    }()
    
    let coinView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor    = .tertiaryLabel
        view.clipsToBounds      = true
        view.layer.cornerRadius = 40
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    let bitCoinImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "bitcoinsign.circle.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor   = UIColor(named: "Icon Color")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let valueLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "..."
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let currencyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "USD"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        return label
    }()
    
    let coinStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
}
