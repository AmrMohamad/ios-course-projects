//
//  ViewController.swift
//  ByteCoin-UIKit-iOS16
//
//  Created by Amr Mohamad on 03/05/2023.
//

import UIKit

class MainViewController: UIViewController, CoinManagerDelegate {

    let ui = CoinUI()
    
    var coinManager = CoinManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        ui.picker.delegate   = self
        ui.picker.dataSource = self
        coinManager.delegate = self
    }


    func didUpdatePriceExchangeRate(priceData: CoinModel) {
        DispatchQueue.main.async {
            self.ui.valueLabel.text    = String(format: "%.2f", priceData.priceExchangeRate)
            self.ui.currencyLabel.text = priceData.currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension MainViewController {
    func setUI(){
        view.backgroundColor = UIColor(named: "Background Color")
        
        view.addSubview(ui.picker)
        let pickerConstrains = [
            ui.picker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
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


extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
}
