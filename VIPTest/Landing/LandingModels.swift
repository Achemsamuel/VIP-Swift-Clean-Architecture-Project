//
//  LandingModels.swift
//  VIPTest
//
//  Created by Achem Samuel on 2/17/20.
//  Copyright (c) 2020 Achem Samuel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Landing
{
    struct ViewModel {
        var userVM = UserViewModel()
    }
    
    // MARK: Use cases
    enum fetchDataOnLoad {
        struct Request {
            //viewcontroller
            //interactor
            var id: String
        }
        
        struct Response {
            var user: user
        }
        
        struct ViewModel {
            var userViewModel: UserViewModel = UserViewModel()
        }
    }
    
    enum FetchdataOnExit {
        
    }
}

struct user {
    var age: Int
    var name: String
    var country: String
    var eyeColor: String
    var wardrobeType: String
    var familyName: String
}

struct UserViewModel {
    var name: String = ""
    var age: Int = 0
    var familyName: String = ""
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