//
//  currencyRow.swift
//  BitView
//
//  Created by Abubakir  Kais on 01/01/2022.
//

import SwiftUI

struct currencyRow: View {
    
    var currency: Currency
    
    var body: some View {
        // One Row
        HStack{
            
            HStack {
                
            Image(currency.logoText)
                .resizable()
                .frame(width: 30 , height: 30)
                .padding(.trailing, 10)
                
                
            
                VStack(alignment: .leading, spacing: 5) {
                
                Text(currency.name)
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                Text(currency.nameShort)
                    .fontWeight(.light)
                    .font(.system(size: 12))
                
            }
            }
            .frame(width: 120,alignment: .leading)
            
            Spacer()
            
            VStack(spacing:5) {
                Text("Investments")
                    .fontWeight(.light)
                    .font(.system(size: 10))
                    
                
                Text(String("0.0"))
                    .font(.system(size: 12))
            }
            .padding(.horizontal)
            
            Spacer()
            
            VStack(spacing:5) {
                Text("Current")
                    .fontWeight(.light)
                    .font(.system(size: 10))
                    
                
                Text(String("0.0"))
                    .font(.system(size: 12))
            }
            .padding(.horizontal)
            
            Spacer()
            
            VStack (spacing:5) {
                Text("Profit")
                    .fontWeight(.semibold)
                    .font(.system(size: 12))
                    .foregroundColor(.green)
                
                Text(String("0.0")+"%")
                    .foregroundColor(.green)
                    .font(.system(size: 12))
            }
        }
        .padding()
    }
}

struct currencyRow_Previews: PreviewProvider {
    
    static var previews: some View {
        currencyRow(currency: CurrenciesDetails[0])
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
