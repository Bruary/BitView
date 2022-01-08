//
//  InvestmentPage.swift
//  BitView
//
//  Created by Abubakir  Kais on 01/01/2022.
//

import SwiftUI

struct InvestmentPage: View {
    
    var investmentModelLocal = investmentModel()
    
    @State private var screenWidth = UIScreen.main.bounds.width
    @State private var selectedCurrency = CurrenciesDetails[0].code
    
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
                
                Group {
                    
                    Text("Currency")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    Picker("Currency", selection: $selectedCurrency) {
                        Text("BTC").tag(CurrenciesDetails[0].code)
                        Text("ETH").tag(CurrenciesDetails[1].code)
                        Text("LTC").tag(CurrenciesDetails[2].code)
                        Text("XRP").tag(CurrenciesDetails[3].code)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                }
                
                Group {
                    
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
                        
                        Text(investmentModelLocal.getTotalAmount(marketprice: self.marketPrice, cryptoAmount: self.cryptoAmount, fees: self.fees))
                            .fontWeight(.semibold)
                            .textFieldStyle(.roundedBorder)
                            
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    
                }
                
                Spacer()
                

                Button {
                    
                    let vest: investmentData = investmentModelLocal.addInvestment(
                                  marketPrice: self.marketPrice,
                                  cryptoAmount: self.cryptoAmount,
                                  fees: self.fees,
                                  investment: investmentData(),
                                  currency: self.selectedCurrency)
                    
//
//                    saveInvestment(investment: vest)
//
//                    print(vest)
//
//                    dismiss()

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

struct InvestmentPage_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentPage()
    }
}
