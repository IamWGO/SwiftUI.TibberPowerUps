//
//  PowerUpsVM.swift
//  TibberPowerUpsChallance
//
//  Created by Waleerat Gottlieb on 2022-03-02.
//

import Foundation
import Apollo

class PowerUpsVM: ObservableObject {
    @Published var powerUpsItems: [Response.PowerUpModel] = []
    @Published var isLoading: Bool = false
    @Published var isFetchError: Bool = false
    @Published var fetchErrorDescription: String = ""
    @Published var selectedRow: Response.PowerUpModel?
    
    init() {
        fetch()
    }
    
    func fetch() {
       Network.share.apollo.fetch(query: PowerUpQueryQuery()) { result in
           switch result {
            case .success(let graphQLResult) :
               if let items = graphQLResult.data?.assignmentData {
                   for item in items {
                       self.powerUpsItems.append(Response.PowerUpModel(item.resultMap as NSDictionary))
                   }
                   self.isFetchError = false
                   self.fetchErrorDescription = ""
                   
                   // Delay of 7.5 seconds
                   DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                       self.isLoading = true
                   }
                   
               } else if let errors = graphQLResult.errors {
                   self.isFetchError = true
                   self.fetchErrorDescription = "\(errors)"
               }
            case .failure(let error) :
                self.isFetchError = true
               self.fetchErrorDescription = "\(error)"
            }
        }
    }
    
    func getPowerUpItems(isConnected: Bool) -> [Response.PowerUpModel]{
        return self.powerUpsItems.filter{ $0.connected == isConnected }
    }
}
