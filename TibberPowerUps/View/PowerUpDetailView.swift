//
//  PowerUpDetailView.swift
//  TibberPowerUps
//
//  Created by Waleerat Gottlieb on 2022-03-02.
//

import SwiftUI

struct PowerUpDetailView: View {
    @EnvironmentObject var powerUpVM: PowerUpsVM
    @Environment(\.openURL) var openURL
    
    @State var powerUpItem: Response.PowerUpModel
    @State var isConnected:Bool = false
    
    var body: some View {
        ZStack {
            BodyColor(backgroundColor: .white)
            VStack {
                NavigationColor()
                VStack{
                    PowerUpConditionView(powerUpItem: powerUpItem, isListView: false)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20){
                            ButtonActionView(buttonLabel: .constant("Disconnect from Tibber") , isActive: $isConnected, action: {
                                isConnected.toggle()
                            })
                            ButtonActionView(buttonLabel: .constant("Buy at Tibber Store") , isActive: .constant(true), action: {
                                openURL(URL(string: powerUpItem.storeUrl)!)
                            })
                        }//:VStack
                        .frame(width: getScreen().width)
                        .padding(.vertical,isIpad() ? 40 : 20)
                        .background(.gray.opacity(0.1))
                        
                        VStack(alignment: .leading, spacing: 10){
                            HStack{
                                Image(systemName: "info.circle")
                                    .foregroundColor(kTopBarBg)
                                Text("More About \(powerUpItem.title)")
                                Spacer()
                            }
                            .modifier(TextTitleModifier())
                            .padding(.bottom, 7)
                                
                            Text(powerUpItem.longDescription)
                                .modifier(TextDescriptionModifier())
                        }
                        .padding()
                    }//:ScrollView
                }
                Spacer()
            }//:VStack
        }//:ZStack
        .padding(0)
        .modifier(NavigationBarTitleModifier(titleBar: powerUpItem.title, isArrowBack: true))
        .onAppear {
            isConnected = powerUpItem.connected
        }
        //:VStack
    }
}
