//
//  CardType.swift
//  Sempoaa
//
//  Created by Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import Foundation

protocol CardType {
    var title: String {get}
    var type: ScreenType {get}
    var backgroundColor: String {get}
    var backgroundImage: String {get}
}
