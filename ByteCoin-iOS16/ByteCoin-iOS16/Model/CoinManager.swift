//
//  CoinManager.swift
//  ByteCoin-iOS16
//
//  Created by Amr Mohamad on 03/05/2023.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePriceExchangeRate (priceData: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "34AF1230-2EC8-4EA1-B37D-F3F02372B074"
    
    let currencyArray = ["AUD","BRL","CAD","CNY",
                         "EUR","GBP","HKD","IDR",
                         "ILS","INR","JPY","MXN",
                         "NOK","NZD","PLN","RON",
                         "RUB","SEK","SGD","USD",
                         "ZAR"]
 
    var delegate: CoinManagerDelegate?
    func getCoinPrice(for currency: String){
        performRequest(with: "\(baseURL)/\(currency)?apikey=\(apiKey)")
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data: Data?, response:URLResponse?, error:Error?) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data{
                    if let priceData = self.parseJSON(data: safeData){
                        self.delegate?.didUpdatePriceExchangeRate(priceData: priceData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let rate     = decodedData.rate
            let currency = decodedData.currency
            
            let priceEx = CoinModel(priceExchangeRate: rate, currency: currency)
            return priceEx
        }catch{
            print(error)
            return nil
        }
    }
    
}
