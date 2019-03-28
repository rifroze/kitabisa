//
//  DetailRouter.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import UIKit

class DetailRouter: DetailWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(card: CardType) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = DetailViewController(card: card)
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
