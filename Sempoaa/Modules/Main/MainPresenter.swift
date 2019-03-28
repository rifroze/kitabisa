//
//  MainPresenter.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import UIKit

class MainPresenter: MainPresenterProtocol {
    
    weak private var view: MainViewProtocol?
    var interactor: MainInteractorProtocol?
    private let router: MainWireframeProtocol

    init(interface: MainViewProtocol, interactor: MainInteractorProtocol?, router: MainWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func openDetail(withCard card: CardType) {
        router.openDetail(withCard: card)
    }
}
