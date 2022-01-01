//
//  User.swift
//  BitView
//
//  Created by Abubakir  Kais on 01/01/2022.
//

import SwiftUI

struct User {
    var id = UUID()
    
    var accounts: [Account]
    var totalInvestments: Double = 0.0
}

let Users: [User] = [
    User(accounts: [
        Account(currency: CurrenciesDetails[0], investments: []),
        Account(currency: CurrenciesDetails[1], investments: []),
        Account(currency: CurrenciesDetails[2], investments: []),
        Account(currency: CurrenciesDetails[3], investments: []),
    ], totalInvestments: 0.0)
]
