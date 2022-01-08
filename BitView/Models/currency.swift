//
//  currency.swift
//  BitView
//
//  Created by Abubakir  Kais on 08/01/2022.
//

import Foundation

struct Currency: Identifiable {
    var id: UUID = UUID()
    var name: String
    var code: String
    var logoText: String
}

let CurrenciesDetails: [Currency] = [
    Currency(name:"Bitcoin", code: "BTC", logoText: "btc_icon"),
    Currency(name:"Ethereum", code: "ETH", logoText: "eth_icon"),
    Currency(name:"Litecoin", code: "LTC", logoText: "ltc_icon"),
    Currency(name:"Ripple", code: "XRP", logoText: "xrp_icon"),
]


