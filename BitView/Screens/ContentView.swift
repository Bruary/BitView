//
//  ContentView.swift
//  BitView
//
//  Created by Abubakir  Kais on 25/12/2021.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @AppStorage("mainUser") var mainUser: Data = Data()
    
    private var menuBarWidth = UIScreen.main.bounds.width
    
    var currencies : [Currency] = CurrenciesDetails
    
    let coreAPI = CoreAPI()
    var users : [User] = Users
    
    @State var investmentPopUpOn: Bool = false
    
    @State private var homeIconColor = "ColorIcons"
    @State private var homeIconTextFontWeight = Font.Weight.thin
    
    @State private var bitcoinIconColor = "ColorIcons"
    @State private var bitcoinIconTextFontWeight = Font.Weight.thin
    
    @State private var walletIconColor = "ColorIcons"
    @State private var walletIconTextFontWeight = Font.Weight.thin
    
    @State private var profileIconColor = "ColorIcons"
    @State private var profileIconTextFontWeight = Font.Weight.thin
    
    
    var body: some View {

        VStack{
            
            // MARK: - HEADER
        ZStack {
            Rectangle()
                .fill(Color("ColorHeading"))
                .ignoresSafeArea()
                .frame(height: 250)
            
            HStack{
                
                Group {
                    VStack {
                        Text("Current Balance")
                            .foregroundColor(Color("ColorSubHeading"))
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Text("$" + String(self.users[0].totalInvestments))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .font(.system(size: 32))
                            .multilineTextAlignment(.center )
                            .padding()
                        
                        Button {
                            investmentPopUpOn.toggle()
                        } label: {
                            
                            ZStack{
                                
                                HStack{
                                    Image(systemName: "plus.square.fill")
                                        .foregroundColor(Color("ColorLightGreen"))
                                        .font(.system(size: 25))
                                    Text("Add investment")
                                }
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 200, height: 55)
                                .background(Color("ColorBlue"))
                                .cornerRadius(10)
                                .font(.system(size: 16))
                                
                            }
                        }
                        .sheet(isPresented: $investmentPopUpOn) {
                            InvestmentPage()
                        }
                    }
                } //: VStack
            } //: HStack
        } //: ZStack
            
            
            // MARK: - CENTER
            Group {
                ScrollView {
                    
                    VStack {
                        
                        ForEach(currencies) {item in
                            currencyRow(currency: item)
                        }
                   
                    } //: VStack
                    .frame(width:  menuBarWidth, alignment: .center)
                    
                } //: ScrollView
            } //: Group
            
            
            
            // MARK: - FOOTER
            ZStack{
                // Menu Bar
                Rectangle()
                    .fill(Color("ColorMenuBar"))
                    .frame(width: menuBarWidth - 40, height: 55, alignment: .center)
                    .cornerRadius(20)
                    .padding(5)
                
                // Menu Bar buttons
                HStack (spacing: 40){
                    Button {
                        homeIconColor = "ColorLightGreen"
                        homeIconTextFontWeight = Font.Weight.semibold
                        
                        // reset color for other menu options
                        bitcoinIconColor = "ColorIcons"
                        walletIconColor = "ColorIcons"
                        profileIconColor = "ColorIcons"
                        
                        //reset font weight for other menu options
                        bitcoinIconTextFontWeight = Font.Weight.thin
                        walletIconTextFontWeight = Font.Weight.thin
                        profileIconTextFontWeight = Font.Weight.thin
                        
                    } label: {
                        
                        VStack (spacing: 5) {
                            Image(systemName: "house.fill").font(.system(size: 20))
                                .foregroundColor(Color(homeIconColor))
                                .padding(3)
                            
                            Text("Home")
                                .foregroundColor(.white)
                                .fontWeight(homeIconTextFontWeight)
                                .font(.system(size: 10))
                            
                            
                        }
                        .padding(5)
                        
                    }
                    
                    Button {
                        bitcoinIconColor = "ColorLightGreen"
                        bitcoinIconTextFontWeight = Font.Weight.semibold
                        
                        // reset color for other menu options
                        homeIconColor = "ColorIcons"
                        walletIconColor = "ColorIcons"
                        profileIconColor = "ColorIcons"
                        
                        //reset font weight for other menu options
                        homeIconTextFontWeight = Font.Weight.thin
                        walletIconTextFontWeight = Font.Weight.thin
                        profileIconTextFontWeight = Font.Weight.thin
                        
                    } label: {
                        VStack (spacing: 5) {
                            Image(systemName: "bitcoinsign.square.fill").font(.system(size: 20))
                                .foregroundColor(Color(bitcoinIconColor))
                                .padding(3)
                            
                            Text("Trade")
                                .foregroundColor(.white)
                                .fontWeight(bitcoinIconTextFontWeight)
                                .font(.system(size: 10))
                            
                        }
                    }
                    .padding(5)
                    
                    
                    Button {
                        walletIconColor = "ColorLightGreen"
                        walletIconTextFontWeight = Font.Weight.semibold
                        
                        // reset color for other menu options
                        homeIconColor = "ColorIcons"
                        bitcoinIconColor = "ColorIcons"
                        profileIconColor = "ColorIcons"
                        
                        //reset font weight for other menu options
                        homeIconTextFontWeight = Font.Weight.thin
                        bitcoinIconTextFontWeight = Font.Weight.thin
                        profileIconTextFontWeight = Font.Weight.thin
                        
                    } label: {
                        VStack (spacing: 5){
                            Image(systemName: "creditcard.fill").font(.system(size: 20))
                                .foregroundColor(Color(walletIconColor))
                                .padding(3)
                            
                            Text("Wallet")
                                .foregroundColor(.white)
                                .fontWeight(walletIconTextFontWeight)
                                .font(.system(size: 10))
                            
                        }
                    }
                    .padding(5)
                    
                    Button {
                        profileIconColor = "ColorLightGreen"
                        profileIconTextFontWeight = Font.Weight.semibold
                        
                        // reset color for other menu options
                        homeIconColor = "ColorIcons"
                        bitcoinIconColor = "ColorIcons"
                        walletIconColor = "ColorIcons"
                        
                        //reset font weight for other menu options
                        homeIconTextFontWeight = Font.Weight.thin
                        bitcoinIconTextFontWeight = Font.Weight.thin
                        walletIconTextFontWeight = Font.Weight.thin
                        
                    } label: {
                        VStack (spacing: 5){
                            Image(systemName: "person.fill").font(.system(size: 20))
                                .foregroundColor(Color(profileIconColor))
                                .padding(3)
                            
                            Text("Profile")
                                .foregroundColor(.white)
                                .fontWeight(profileIconTextFontWeight)
                                .font(.system(size: 10))
                            
                        }
                    }
                    .padding(5)
                    
                    
                    
                    
                }
                .padding(5)
                
            }
            
            
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
