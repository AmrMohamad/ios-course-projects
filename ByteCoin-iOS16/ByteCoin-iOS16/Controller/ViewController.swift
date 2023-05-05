//
//  ViewController.swift
//  ByteCoin-iOS16
//
//  Created by Amr Mohamad on 03/05/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bitcoinValueLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate   = self
        coinManager.delegate      = self
    }


}
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
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

extension ViewController: CoinManagerDelegate{
    func didUpdatePriceExchangeRate(priceData: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinValueLabel.text = String(format: "%.2f", priceData.priceExchangeRate)
            self.currencyLabel.text     = priceData.currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
