//
//  DetailPresenter.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
    
    weak private var view: DetailViewProtocol?
    var interactor: DetailInteractorProtocol?
    private let router: DetailWireframeProtocol

    init(interface: DetailViewProtocol, interactor: DetailInteractorProtocol?, router: DetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func calculate(first: String, second: String, type: ScreenType) {
        interactor?.calculate(first: first, second: second, type: type)
    }
    
    func didGet(value: String) {
        view?.didGet(value: value)
    }
}
