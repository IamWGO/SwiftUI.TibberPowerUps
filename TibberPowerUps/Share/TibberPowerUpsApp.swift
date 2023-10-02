//
//  TibberPowerUpsApp.swift
//  TibberPowerUps
//
//  Created by Waleerat Gottlieb on 2022-03-02.
//

import SwiftUI

@main
struct TibberPowerUpsApp: App {
    @StateObject var powerUpsVM = PowerUpsVM()
    
    init() {
        //UINavigationBar.appearance().backgroundColor = UIColor.blue
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(powerUpsVM)
            }
            .modifier(NavigationPropertiesModifier())
        }
    }
}

