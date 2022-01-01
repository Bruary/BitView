//
//  Currencies.swift
//  BitView
//
//  Created by Abubakir  Kais on 01/01/2022.
//

import SwiftUI

struct Currency: Identifiable {
    var id = UUID()
    var name: String
    var nameShort: String
    var logoText: String
}

let CurrenciesDetails: [Currency] = [
    Currency(name:"Bitcoin", nameShort: "BTC", logoText: "btc_icon"),
    Currency(name:"Ethereum", nameShort: "ETH", logoText: "eth_icon"),
    Currency(name:"Litecoin", nameShort: "LTC", logoText: "ltc_icon"),
    Currency(name:"Ripple", nameShort: "XRP", logoText: "xrp_icon"),
]


