//
//  ViewController.swift
//  ByteCoin-UIKit-iOS16
//
//  Created by Amr Mohamad on 03/05/2023.
//

import UIKit

class MainViewController: UIViewController {

    let ui = CoinUI()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }


}

extension MainViewController {
    func setUI(){
        view.backgroundColor = UIColor(named: "Background Color")
        
        view.addSubview(ui.picker)
        let pickerConstrains = [
            ui.picker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30),
            ui.picker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ui.picker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ui.picker.heightAnchor.constraint(equalToConstant: 216)
        ]
        
        
        let stackCoinView = UIStackView(
            arrangedSubviews: [
                ui.bitCoinImage,
                ui.valueLabel,
                ui.currencyLabel
            ]
        )
       stackCoinView.translatesAutoresizingMaskIntoConstraints = false
       stackCoinView.axis         = .horizontal
       stackCoinView.alignment    = .center
       stackCoinView.distribution = .fill
       stackCoinView.spacing      = 10
        
        let stackMain = UIStackView(
            arrangedSubviews: [
                ui.byteCnLabel,
                ui.coinView
            ]
        )
        view.addSubview(stackMain)
        stackMain.translatesAutoresizingMaskIntoConstraints = false
        stackMain.axis         = .vertical
        stackMain.alignment    = .center
        stackMain.distribution = .fill
        stackMain.spacing      = 25
        


        let stackMainConstrains = [
            stackMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackMain.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackMain.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        
        ui.coinView.addSubview(stackCoinView)
        
        let stackCoinViewConstrains = [
            stackCoinView.trailingAnchor.constraint(equalTo: ui.coinView.trailingAnchor,
                                                    constant: -10),
            stackCoinView.leadingAnchor.constraint(equalTo: ui.coinView.leadingAnchor),
            stackCoinView.bottomAnchor.constraint(equalTo: ui.coinView.bottomAnchor),
            stackCoinView.topAnchor.constraint(equalTo: ui.coinView.topAnchor)
            
        ]
        
        let bitCoinImageConstrains = [
            ui.bitCoinImage.topAnchor.constraint(equalTo: stackCoinView.topAnchor),
            ui.bitCoinImage.bottomAnchor.constraint(equalTo: stackCoinView.bottomAnchor),
            ui.bitCoinImage.widthAnchor.constraint(equalToConstant: 80)
        ]
        
        
        NSLayoutConstraint.activate(pickerConstrains)
        NSLayoutConstraint.activate(stackMainConstrains)
        NSLayoutConstraint.activate(stackCoinViewConstrains)
        NSLayoutConstraint.activate(bitCoinImageConstrains)

    }
}
