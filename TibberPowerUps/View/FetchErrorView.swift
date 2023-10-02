//
//  FetchErrorView.swift
//  TibberPowerUps
//
//  Created by Waleerat Gottlieb on 2022-03-03.
//

import SwiftUI

struct FetchErrorView: View {
    @EnvironmentObject var powerUpVM: PowerUpsVM
    
    var body: some View {
        ZStack {
            kTopBarBg
            VStack {
                Spacer()
                
                Button {
                    powerUpVM.fetch()
                } label: {
                    Image("tibber-logo")
                        .resizable()
                        .frame(width: isIpad() ? 400 : 200, height: isIpad() ? 400 : 200)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                } 
                
                Text("Not able to fetch data.")
                    .foregroundColor(.white)
                    .modifier(TextTitleModifier())
                Text("Tab logo to try again")
                    .foregroundColor(.white)
                    .modifier(TextDescriptionModifier())
                Spacer()
                Spacer()
            }
        }.ignoresSafeArea(.all)
    }
}

struct FetchErrorView_Previews: PreviewProvider {
    static var previews: some View {
        FetchErrorView()
    }
}
