//
//  investmentModel.swift
//  BitView
//
//  Created by Abubakir  Kais on 08/01/2022.
//

import Foundation

class investmentModel {
    
    func getTotalAmount(marketprice a:String, cryptoAmount b:String, fees c:String) -> String {
        if a != "" && b != "" && c != "" {
            guard
            let x = Double(a),
            let y = Double(b),
            let z = Double(c) else {
                return "0.0"
            }
            
            return String((x*y) + z)
        }
        
        return "0.0"
    }

    func addInvestment(marketPrice a: String, cryptoAmount b:String, fees c: String, investment d: investmentData, currency e:String) -> investmentData {
        if a != "" && b != "" && c != "" {
            guard
            let x = Double(a),
            let y = Double(b),
            let z = Double(c) else {
                
                return d
            }
            
            var investmentMain = d
            
            investmentMain.marketPrice = x
            investmentMain.cryptoAmount = y
            investmentMain.fees = z
            investmentMain.totalAmount = (x * y) + z
            investmentMain.subTotalAmount = (x * y) - z
            investmentMain.dateAdded = Date.now
            investmentMain.currencyCode = e
            
            return investmentMain
        }
        
        return d
    }

    func saveInvestment(investment: investmentData) {

    }
}
