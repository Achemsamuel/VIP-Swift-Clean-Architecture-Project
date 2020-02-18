//
//  User.swift
//  VIPTest
//
//  Created by Achem Samuel on 2/18/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation

struct user {
    var age: Int
    var name: String
    var country: String
    var eyeColor: String
    var wardrobeType: String
    var familyName: String
}

extension user {
    func toviewModel() -> UserViewModel {
        var userVM = UserViewModel()
        userVM.name = name
        userVM.age = age
        userVM.familyName = familyName
        
        return userVM
    }
}
