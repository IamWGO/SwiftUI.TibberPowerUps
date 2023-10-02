//
//  LoadingView.swift
//  TibberPowerUps
//
//  Created by Waleerat Gottlieb on 2022-03-03.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            kTopBarBg
            VStack {
                Spacer()
                Image("tibber-logo")
                    .resizable()
                    .frame(width: isIpad() ? 400 : 200, height: isIpad() ? 400 : 200)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                Text("Tibber")
                    .foregroundColor(.white)
                    .modifier(TextTitleModifier())
                Spacer()
                Spacer()
            }
        }.ignoresSafeArea(.all)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
