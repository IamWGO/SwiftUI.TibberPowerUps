//
//  Modifier.swift
//  TibberPowerUps
//
//  Created by Waleerat Gottlieb on 2022-03-02.
//

import Foundation
import SwiftUI


struct NavigationPropertiesModifier : ViewModifier {
    func body(content: Content) -> some View {
    content
        .accentColor(.accentColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NavigationBarTitleModifier : ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    var titleBar: String
    var isArrowBack: Bool = false
    
    func body(content: Content) -> some View {
    content
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    if isArrowBack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack{
                                Image(systemName: "arrow.backward")
                                    .font(.system(size: isIpad() ? 30 : 18 ,weight: .regular, design: .rounded))
                                    .foregroundColor(.white)
                            }.foregroundColor(.white)
                        }
                    }
                    
                    Text(titleBar)
                        .fontWeight(.heavy)
                        .font(.system(size: isIpad() ? 25 : 16))
                        .foregroundColor(.white)
                        .modifier(CustomShadowModifier())
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabSelecterModifier : ViewModifier {
    var isActive:Bool = false
    func body(content: Content) -> some View {
    content
        .multilineTextAlignment(.center)
        .foregroundColor(isActive ? .white : kTopBarBg.opacity(0.7))
        .font(.system(size: isIpad() ? 25 : 16 ,weight: .regular, design: .rounded))
        .padding(.vertical,10)
        .padding(.horizontal,35)
        
    }
}

struct TextTitleModifier: ViewModifier {
    var foregroundColor = Color.accentColor
    func body(content: Content) -> some View {
    content
        .font(.system(size: isIpad() ? 30 : 17 ,weight: .bold, design: .rounded))
        .lineLimit(nil)
        .multilineTextAlignment(.leading)
        .foregroundColor(kTitleColor)
    }
}

struct TextAbstractModifier: ViewModifier {
    var foregroundColor = Color.accentColor
    func body(content: Content) -> some View {
    content
        .font(.system(size: isIpad() ? 25 : 15 ,weight: .regular, design: .rounded))
        .lineLimit(3)
        .multilineTextAlignment(.leading)
        .foregroundColor(kDescriptionColor)
    }
}

struct TextDescriptionModifier: ViewModifier {
    var foregroundColor = Color.accentColor
    func body(content: Content) -> some View {
    content
        .font(.system(size: isIpad() ? 25 : 15 ,weight: .regular, design: .rounded))
        .multilineTextAlignment(.leading)
        .foregroundColor(kDescriptionColor)
    }
}


struct CustomShadowModifier : ViewModifier {
   func body(content: Content) -> some View {
   content
       .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0.0, y: 2.0)
   }
}
