//
//  UserDefaultManager.swift
//  Bookquipo
//
//  Created by Elmy on 26/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import Foundation

class UserDefaultManager : UserDefaults {
   static let shared = UserDefaultManager()
    
    fileprivate let bookmarkDatas = "bookmarkDatas"
    fileprivate let profileDatas = "profileDatas"
    
    fileprivate var preference: UserDefaults = {
        return UserDefaults.standard
    }()
    
    // store and return bookmark Data in preference
    var bookmarkData : [Books]? {
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                preference.set(encoded, forKey: bookmarkDatas)
            }
        }
        get {
            if let blogData = UserDefaults.standard.data(forKey: bookmarkDatas),
                let blog = try? JSONDecoder().decode([Books].self, from: blogData) {
                return blog
            }
            return nil
        }
    }
    
    // store and return userProfile Data in preference
    var userProfile : UserProfile? {
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                preference.set(encoded, forKey: profileDatas)
            }
        }
        get {
            if let blogData = UserDefaults.standard.data(forKey: profileDatas),
                let blog = try? JSONDecoder().decode(UserProfile.self, from: blogData) {
                return blog
            }
            return UserProfile(name: "User", image: "userProfile", dob: "01/03/2001", address: "20 Stewart Street, Unit 703, Toronto, ON", gender: "Male")
        }
    }
    
    // to save to userdefaults
    func save() {
        preference.synchronize( )
    }
    
}
