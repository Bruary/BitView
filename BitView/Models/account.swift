//
//  Accounts.swift
//  BitView
//
//  Created by Abubakir  Kais on 01/01/2022.
//

import SwiftUI

struct Account: Identifiable {
    var id = UUID()
    
    var currency: Currency
    var investments:[investmentData]
}

class investmentData: Codable {
    var currencyCode: String
    var cryptoAmount: Double
    var totalAmount: Double
    var subTotalAmount: Double
    var fees: Double
    var marketPrice: Double
    var dateAdded: Date
    
    init() {
        currencyCode = ""
        cryptoAmount = 0.0
        totalAmount = 0.0
        subTotalAmount = 0.0
        fees = 0.0
        marketPrice = 0.0
        dateAdded = Date.now
    }
}



