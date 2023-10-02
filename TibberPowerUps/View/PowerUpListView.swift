//
//  PowerUpListView.swift
//  TibberPowerUps
//
//  Created by Waleerat Gottlieb on 2022-03-02.
//

import SwiftUI

struct PowerUpListView: View {
    @EnvironmentObject var powerUpVM: PowerUpsVM
    
    @State var index = 0
    
    var body: some View {
        ZStack {
            BodyColor()
            VStack {
                NavigationColor()
                VStack{
                    // MARK: - Tab Selection
                    HStack(spacing: 0){
                        TabSlidePreview(title: "Connected", isActive: .constant(self.index == 0))
                            .onTapGesture {
                                withAnimation(.default){
                                    self.index = 0
                                }
                            }
                        TabSlidePreview(title: "Disconnect", isActive: .constant(self.index == 1))
                        .onTapGesture {
                            withAnimation(.default){
                                self.index = 1
                            }
                        }
                    }//:HStack
                    .frame(width: isIpad() ? getScreen().width * 0.7 : getScreen().width * 0.98)
                    .background(Color.black.opacity(0.03))
                    .clipShape(Capsule())
                    .padding(.bottom,25)
                    
                    // MARK: - Preview Selection
                    TabView(selection: self.$index){
                        PowerUpItemPreveiw(isConnected: true).tag(0)
                        PowerUpItemPreveiw(isConnected: false).tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    Spacer(minLength: 0)
                }//:VStack
                .padding(.top)
                
                Spacer()
            }//:VStack
        }//:ZStack
        .modifier(NavigationBarTitleModifier(titleBar: "Power-ups"))
        .ignoresSafeArea(.all, edges: [.trailing])
        .padding(0)
         
    }
}

// MARK: - Tab Slide View
struct TabSlidePreview: View {
    @State var title: String
    @Binding var isActive: Bool
    
    var body: some View {
        VStack{
        Text(title)
            .modifier(TabSelecterModifier(isActive: isActive))
        }
        .frame(width: isIpad() ? getScreen().width * 0.35 : getScreen().width * 0.49)
        .background(kTopBarBg.opacity(isActive ? 1 : 0))
        .clipShape(Capsule())
    }
}

// MARK: - Fetch Data View
struct PowerUpItemPreveiw: View {
    @EnvironmentObject var powerUpVM: PowerUpsVM
    @State var isConnected: Bool
    @State var items: [Response.PowerUpModel] = []
    
    var body: some View {
        VStack{
            if (powerUpVM.getPowerUpItems(isConnected: isConnected).count > 0) {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(powerUpVM.getPowerUpItems(isConnected: isConnected)) { powerupItem in
                        PowerUpConditionView(powerUpItem: powerupItem, isListView: true)
                    }
                }
            } else {
                Spacer()
                Image("tibber-logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                Text(isConnected ? "No Connected" : "No Disconnected")
                    .modifier(TextTitleModifier())
                Spacer()
                Spacer()
            }
        }
    }
}


// MARK: - List or Detail View
struct PowerUpConditionView: View {
    @EnvironmentObject var powerUpVM: PowerUpsVM
    @State var powerUpItem: Response.PowerUpModel
    @State var isListView: Bool
    
    var body: some View {
        VStack{
            if isListView {
                NavigationLink(destination: PowerUpDetailView(powerUpItem: powerUpItem)) {
                    PowerUpPreview(powerUpItem: powerUpItem, isListView: isListView)
                }
            } else {
                PowerUpPreview(powerUpItem: powerUpItem, isListView: isListView)
            }
        }//:VStack
    }//:Body
}

// MARK: - Item View
struct PowerUpPreview: View {
    @State var powerUpItem: Response.PowerUpModel
    @State var isListView: Bool
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: powerUpItem.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                kTopBarBg
            }
            .frame(width: isListView ? 70 : 100, height: isListView ? 70 : 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .modifier(CustomShadowModifier())
           
            VStack(alignment: .leading, spacing: 10, content: {
                
                Text(powerUpItem.title)
                    .modifier(TextTitleModifier())
                
                Text(powerUpItem.description)
                    .modifier(TextAbstractModifier())
            }).padding(.leading, 5)
            //:VStack
            Spacer()
            if isListView {
                Image(systemName: "chevron.right")
                    .modifier(TextAbstractModifier())
            }
            
        }//:HStack
        .padding(isIpad() ? 20 : 10)
        .background(isListView ? .white : Color.gray.opacity(0))
        .clipShape(RoundedRectangle(cornerRadius: isListView ? 10: 0))
        .padding(isListView ? .horizontal : .vertical, 5)
    }//:Body
}



