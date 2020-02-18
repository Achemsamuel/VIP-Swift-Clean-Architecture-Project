//
//  LandingInteractor.swift
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

protocol LandingBusinessLogic: DataDelegate
{
    func fetchDataOnLoad(request: Landing.fetchDataOnLoad.Request)
    func fetchDataOnExit()
}

protocol LandingDataStore
{
    var User: user? {get set}
    var userVm: UserViewModel {get set}
}

class LandingInteractor: LandingBusinessLogic, LandingDataStore
{
    
  var userVm: UserViewModel = UserViewModel()
  var User: user?
  var presenter: LandingPresentationLogic?

    func fetchDataOnLoad(request: Landing.fetchDataOnLoad.Request) {
        let userObject = user(age: 23, name: "Emmanuel", country: "Nigeria", eyeColor: "blue", wardrobeType: "native", familyName: "Okwara")
        let response = Landing.fetchDataOnLoad.Response(user: userObject)
        self.User = userObject
        self.userVm = userObject.toviewModel()
        presenter?.presentDataOnLoad(response: response)
    }
    
    func fetchDataOnExit() {
        
    }
    
    func passDataBack(user: user) {
        print("data gotten back\(user)")
    }
    
}
