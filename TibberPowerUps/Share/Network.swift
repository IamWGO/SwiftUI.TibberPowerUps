//
//  Network.swift
//  TibberPowerUpsChallance
//
//  Created by Waleerat Gottlieb on 2022-03-02.
//

import Foundation
import Apollo

class Network {
    static let share = Network()
    
    let url = "https://app.tibber.com/v4/gql"
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
    
    
}
