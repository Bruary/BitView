//
//  Accounts.swift
//  BitView
//
//  Created by Abubakir  Kais on 01/01/2022.
//

import SwiftUI

struct investmentData {
    var currencyCode: String
    var cryptoAmount: Double
    var totalAmount: Double
    var subTotalAmount: Double
    var fees: Double
    var marketPrice: Double
    var dateAdded: Date
}

struct Account: Identifiable {
    var id = UUID()
    
    var currency: Currency
    var investments:[investmentData]
}


