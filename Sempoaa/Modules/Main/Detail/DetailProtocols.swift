//
//  DetailProtocols.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol DetailWireframeProtocol: class {

}
//MARK: Presenter -
protocol DetailPresenterProtocol: class {
    func calculate(first: String, second: String, type: ScreenType)
    func didGet(value: String)
}

//MARK: Interactor -
protocol DetailInteractorProtocol: class {
    var presenter: DetailPresenterProtocol?  { get set }
    func calculate(first: String, second: String, type: ScreenType)
    func sum(first: Int, second: Int) -> String
    func multiply(first: Int, second: Int) -> String
    func prime(first: Int) -> String
    func fibonacci(first: Int) -> String
}

//MARK: View -
protocol DetailViewProtocol: class {
    var presenter: DetailPresenterProtocol?  { get set }
    func didGet(value: String)
}
