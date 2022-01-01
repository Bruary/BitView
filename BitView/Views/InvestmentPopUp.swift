//
//  InvestmentPopUp.swift
//  BitView
//
//  Created by Abubakir  Kais on 27/12/2021.
//

import SwiftUI

enum  Currencies {
    case Bitcoin
    case Ethereum
    case Litecoin
    case Ripple
}

class cryptoCurrenciesGetResponse {
    var currency: String?
    var name:String?
    var logo_url:String?
    var status:String?
    var price:String?
}



struct InvestmentPopUp: View {

    let calculations = Calculations()
//    @State var investment: investmentData

    @State private var screenWidth = UIScreen.main.bounds.width
    @State private var selectedCurrency = Currencies.Bitcoin

    @State var cryptoAmount:String = ""

    @State var marketPrice: String = ""
    
    @State var fees: String = ""

    var subTotalValueDouble: String {
        //check if both fields have text else no need for message
        guard marketPrice.isEmpty == false, cryptoAmount.isEmpty == false, fees.isEmpty == false else { return "0.00" }

        //check if both are numbers else we need to print "Error"
        guard let m = Double(marketPrice), let n  = Double(cryptoAmount), let x = Double(fees) else { return "Error" }

        let product = (m * n) + x
        return String(format: "%.2f", product)
    }

    @State var totalValue: String = ""

    var currenciesArray = ["BTC", "ETH", "LTC", "XRP"]

//    var object: [String: Any] = [
//        "total_amount": 0.0,
//        "subtotal_amount": 0.0,
//        "fees": 0.0,
//        "currency": Currencies.self,
//        ]

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
                        Text("BTC").tag(Currencies.Bitcoin)
                        Text("ETH").tag(Currencies.Ethereum)
                        Text("LTC").tag(Currencies.Litecoin)
                        Text("XRP").tag(Currencies.Ripple)
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

                        Text(subTotalValueDouble)
                            .fontWeight(.semibold)
                            .textFieldStyle(.roundedBorder)

                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)

                }

                Spacer()

                Button {

                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: screenWidth - 40, height: 60, alignment: .center)
                            .cornerRadius(10)
                            .onTapGesture {

//                                guard
//                                    cryptoAmount != "",
//                                    marketPrice != "",
//                                    fees != "" else {
//                                        print("Error in investments guard.")
//                                    }



                                //calculations.addInvestment(user: Users[0], investment: investment)
                            }

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

struct InvestmentPopUp_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentPopUp()
    }
}
