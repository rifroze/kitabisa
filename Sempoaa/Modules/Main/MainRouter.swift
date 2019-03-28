//
//  MainRouter.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import UIKit

class MainRouter: NSObject, MainWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(cards: [CardType]) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = MainViewController(cards: cards)
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func openDetail(withCard card: CardType) {
        let vc = DetailRouter.createModule(card: card)
        vc.hero.isEnabled = true
        viewController?.present(vc, animated: true, completion: nil)
    }
}

extension MainRouter: UIViewControllerTransitioningDelegate {}
