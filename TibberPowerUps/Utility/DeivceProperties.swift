//
//  DeivceProperties.swift
//  TibberPowerUps
//
//  Created by Waleerat Gottlieb on 2022-03-02.
//

import Foundation
import SwiftUI

// MARK: - Devices
enum Device{
   case iPhone
   case iPad
   case macOS
}

func getDevice()->Device{
    #if os(iOS)
    
    // Since There is No Direct For Getting iPad OS...
    // Alternative Way...
    if UIDevice.current.model.contains("iPad"){
        return .iPad
    }
    else{
        return .iPhone
    }
    #else
    return .macOS
    #endif
}

func getScreen()->CGRect{
    #if os(iOS)
    return UIScreen.main.bounds
    #else
    return NSScreen.main!.visibleFrame
    #endif
}

func isIpadAndMacOS() -> Bool {
    return  getDevice() == .iPad || getDevice() == .macOS ? true : false
}

func isIpadAndIphone() -> Bool {
    return  getDevice() == .iPad || getDevice() == .iPhone ? true : false
}

func isIpad() -> Bool {
    return  getDevice() == .iPad ? true : false
}

func isIphone() -> Bool {
    return  getDevice() == .iPhone ? true : false
}


func getColumn() -> [GridItem] {
    if isIpad() {
        return [
                GridItem(.flexible()),
                GridItem(.flexible()),
               // GridItem(.flexible()),
            ]
    } else {
        return [GridItem(.flexible())]
    }
}
