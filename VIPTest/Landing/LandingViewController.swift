//
//  LandingViewController.swift
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

class LandingViewController: UIViewController
{
    var interactor: LandingBusinessLogic?
    var router: (NSObjectProtocol & LandingRoutingLogic & LandingDataPassing)?
    var viewModel = Landing.ViewModel()
    
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
        let interactor = LandingInteractor()
        let presenter = LandingPresenter()
        let router = LandingRouter()
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
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var agelabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        interactor?.fetchDataOnLoad(request: Landing.fetchDataOnLoad.Request(id: "Macco"))
    }
        
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        router?.routeToDetailScene(segue: nil)
    }
    
}

extension LandingViewController: LandingDisplayLogic {
    
    func displayDataOnLoad(viewModel: Landing.fetchDataOnLoad.ViewModel) {
        self.viewModel.userVM = viewModel.userViewModel
        updateViews()
        print(viewModel.userViewModel)
    }
    
    func updateViews() {
        self.agelabel.text = ("\(self.viewModel.userVM.age)")
        self.countryLabel.text = self.viewModel.userVM.familyName
        self.nameLabel.text = self.viewModel.userVM.name
    }
}
