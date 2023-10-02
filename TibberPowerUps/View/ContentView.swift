//
//  ContentView.swift
//  TibberPowerUps
//
//  Created by Waleerat Gottlieb on 2022-03-02.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var powerUpVM: PowerUpsVM
    
    var body: some View {
        if powerUpVM.isLoading {
            if !powerUpVM.isFetchError {
                PowerUpListView()
            } else {
                FetchErrorView()
            }
        } else {
            LoadingView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
