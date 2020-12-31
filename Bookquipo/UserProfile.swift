//
//  UserProfile.swift
//  Bookquipo
//
//  Created by Nency Shobhashana on 26/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import Foundation

class UserProfile : Codable {
    
    var name:String
    var image: String
    var dob: String
    var address: String
    var gender: String
    
    init(name:String, image:String, dob:String, address:String, gender:String) {
        self.name = name
        self.image = image
        self.dob = dob
        self.address = address
        self.gender = gender
    }
}
