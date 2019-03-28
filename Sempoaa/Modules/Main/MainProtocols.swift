//
//  MainProtocols.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol MainWireframeProtocol: class {
    func openDetail(withCard card: CardType)
}
//MARK: Presenter -
protocol MainPresenterProtocol: class {
    func openDetail(withCard card: CardType)
}

//MARK: Interactor -
protocol MainInteractorProtocol: class {

  var presenter: MainPresenterProtocol?  { get set }
}

//MARK: View -
protocol MainViewProtocol: class {

  var presenter: MainPresenterProtocol?  { get set }
}
