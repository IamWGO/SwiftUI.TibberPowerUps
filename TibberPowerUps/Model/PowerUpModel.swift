//
//  PowerUpModel.swift
//  TibberPowerUps
//
//  Created by Waleerat Gottlieb on 2022-03-02.
//

import Foundation

struct Response: Decodable {
    
    struct PowerUpModel: Identifiable, Decodable {
        var id:String
        let title: String
        let description: String
        let longDescription: String
        var connected: Bool
        let storeUrl: String
        let imageUrl: String
        
        init(_ dictionary : NSDictionary) {
            id = UUID().uuidString
            title = dictionary["title"] as? String ?? ""
            description = dictionary["description"] as? String ?? ""
            longDescription = dictionary["longDescription"] as? String ?? ""
            connected = dictionary["connected"] as? Bool ?? false
            storeUrl = dictionary["storeUrl"] as? String ?? ""
            imageUrl = dictionary["imageUrl"] as? String ?? ""
        }

    }
}



/*
 query LaunchList {
 launches {
   id
   site
   mission {
     name
   }
   rocket {
     id
     name
     type
   }
   isBooked
 }
 }
 
 
 
 query LaunchList {
   launches {
     launches {
       id
       site
       mission {
         name
       }
       rocket {
         id
         name
         type
       }
       isBooked
     }
   }
 }
 */
