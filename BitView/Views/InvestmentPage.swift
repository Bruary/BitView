//
//  InvestmentPage.swift
//  BitView
//
//  Created by Abubakir  Kais on 01/01/2022.
//

import SwiftUI

class InvestUtils {
    let availableCurrencies: [Currency] = CurrenciesDetails
    
    var investment: investmentData = investmentData(currencyCode: "BTC", cryptoAmount: 0.0, totalAmount: 0.0, subTotalAmount: 0.0, fees: 0.0, marketPrice: 0.0, dateAdded: Date.now)
    
}

struct InvestmentPage: View {
    
    var investmentClass = InvestUtils()
    
    @State private var screenWidth = UIScreen.main.bounds.width
    @State private var selectedCurrency = CurrenciesDetails[0].nameShort
    
    @State var cryptoAmount:String = ""
    @State var marketPrice: String = ""
    @State var fees: String = ""
    @State var totalValue: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .padding([.top, .leading],35)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                    
                    
                    Spacer()
                }//: HStack
                .padding(.bottom,50)
                
                Section{
                    
                    Text("Currency")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    Picker("Currency", selection: $selectedCurrency) {
                        Text("BTC").tag(CurrenciesDetails[0].nameShort)
                        Text("ETH").tag(CurrenciesDetails[1].nameShort)
                        Text("LTC").tag(CurrenciesDetails[2].nameShort)
                        Text("XRP").tag(CurrenciesDetails[3].nameShort)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                }
                
                Section{
                    
                    Text("Purchase Details")
                        .fontWeight(.bold)
                        .padding(.top,30)
                    
                    
                    HStack {
                        
                        Text("Market price")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        TextField("Enter price", text: $marketPrice)
                            .shadow(radius: 2)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                            .frame(width: 200, alignment: .trailing)
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    
                    HStack {
                        
                        Text("Crypto Amount")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        TextField("Enter amount", text: $cryptoAmount)
                            .shadow(radius: 2)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                            .frame(width: 200, alignment: .trailing)
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    
                    HStack {
                        
                        Text("Fees")
                            .padding(.horizontal)
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        TextField("Enter fees", text: $fees)
                            .shadow(radius: 2)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                            .frame(width: 200, alignment: .trailing)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .foregroundColor(.green)
                            .font(.system(size: 35))
                        
                        Text("Total amount spent in USD: ")
                        
                        Text(getTotalAmount(marketprice: self.marketPrice, cryptoAmount: self.cryptoAmount, fees: self.fees))
                            .fontWeight(.semibold)
                            .textFieldStyle(.roundedBorder)
                            
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    
                }
                
                Spacer()
                

                Button {
                    
                    let vest: investmentData = addInvestment(marketPrice: self.marketPrice,
                                  cryptoAmount: self.cryptoAmount,
                                  fees: self.fees,
                                  investment: investmentClass.investment,
                                  currency: self.selectedCurrency)

                    print(vest)

                    dismiss()

                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: screenWidth - 40, height: 60, alignment: .center)
                            .cornerRadius(10)


                        Text("Calculate")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
                
            }//: VStack
            
        }
    }
}

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

struct InvestmentPage_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentPage()
    }
}
