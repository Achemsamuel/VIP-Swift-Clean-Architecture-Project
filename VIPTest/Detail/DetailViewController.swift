//
//  DetailViewController.swift
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

protocol DetailDisplayLogic: class
{
  
}

class DetailViewController: UIViewController, DetailDisplayLogic
{
    static let STORYBOARD_ID = String(describing: DetailViewController.self)
       class var storyboardName: String {
           return "Main"
       }
  var interactor: DetailBusinessLogic?
  var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = DetailInteractor()
    let presenter = DetailPresenter()
    let router = DetailRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    interactor?.passBackUser()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!

}
