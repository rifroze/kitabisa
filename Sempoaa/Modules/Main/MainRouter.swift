//
//  MainRouter.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import UIKit

class MainRouter: NSObject, MainWireframeProtocol {
    
    private let animationController = DAExpandAnimation()
    
    weak var viewController: UIViewController?
    var card: CardType!
    
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
        self.card = card
        let vc = DetailRouter.createModule(card: card)
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        viewController?.present(vc, animated: true, completion: nil)
    }
}

extension MainRouter: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animationController
    }    
}
