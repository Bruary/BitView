//
//  CoreAPI.swift
//  BitView
//
//  Created by Abubakir  Kais on 31/12/2021.
//

import Alamofire
import Combine
import Foundation

struct GetCurrenciesResponse: Decodable {
    var id:String?
    var currency: String?
    var symbol: String?
    var name: String?
    var logo_url: String?
    var status: String?
    var price: String?
    var price_date: String?
    var price_timestamp: String?
    var circulating_supply: String?
    var max_supply: String?
    var market_cap: String?
    var market_cap_dominance: String?
    var num_exchanges: String?
    var num_pairs: String
    var num_pairs_unmapped: String?
    var first_candle: String?
    var first_trade: String?
    var rank: String?
    var rank_delta: String?
    var high: String?
    var high_timestamp: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case currency = "currency"
        case symbol = "symbol"
        case name = "name"
        case logo_url = "logo_url"
        case status = "status"
        case price = "price"
        case price_date = "price_date"
        case price_timestamp = "price_timestamp"
        case circulating_supply = "circulating_supply"
        case max_supply = "max_supply"
        case market_cap = "market_cap"
        case market_cap_dominance = "market_cap_dominance"
        case num_exchanges = "num_exchanges"
        case num_pairs = "num_pairs"
        case num_pairs_unmapped = "num_pairs_unmapped"
        case first_candle = "first_candle"
        case first_trade = "first_trade"
        case rank = "rank"
        case high = "high"
        case high_timestamp = "high_timestamp"
        
        
    }
}

typealias ResponseMain = [GetCurrenciesResponse]

class CoreAPI {
    
    func GetCurrencies()  {
            
                AF.request("https://api.nomics.com/v1/currencies/ticker?key=m_875081ad0011453842df0b214e161109072444d6&ids=ETH,BTC,XPR,LTC&interval=1d,30d,365d&convert=USD&per-page=100&page=1")
                    .responseJSON { response in
                        
                        guard
                            let statusCode = response.response?.statusCode,
                            let data = response.data,
                            statusCode < 500 else {
                                print("error!!!!!")
                                return
                            }
                        
                        guard
                            statusCode == 200 else {
                                do {
                                    print("didnt work, error")
                                    return
                                } catch {
                                    print("lol error")
                                    return
                                }
                                
                            }
                        
                        do {
                            let decodedObject = try JSONDecoder().decode(ResponseMain.self, from: data)
                            print("the response: \(decodedObject[0])" )
                            return
                        } catch {
                            print("error second catch")
                            return
                        }
                        
                        debugPrint("The response: \(response.data)")
                        return
                    }
            
        
    }
    
}


