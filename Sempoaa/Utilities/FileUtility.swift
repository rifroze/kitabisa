//
//  FileUtility.swift
//  Sempoaa
//
//  Created by Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import Foundation

class FileUtility {
    static func readJson(with name: String) -> Data? {
        guard let path = Bundle.main.url(forResource: name, withExtension: "json") else {return nil}
        return try? Data(contentsOf: path, options: .alwaysMapped)
    }
    static func readCards(withName filename: String) -> Cards {
        guard let json = readJson(with: filename), let cards = try? Cards.init(data: json) else {return []}
        return cards
    }
}
