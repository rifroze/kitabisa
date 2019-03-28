//
//  DetailInteractor.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import UIKit

class DetailInteractor: DetailInteractorProtocol {
    
    weak var presenter: DetailPresenterProtocol?
    
    func calculate(first: String, second: String, type: ScreenType) {
        var value = ""
        switch type {
            case .sum: value = sum(first: Int(first)!, second: Int(second)!)
            case .multiply: value = multiply(first: Int(first)!, second: Int(second)!)
            case .prime: value = prime(first: Int(first)!)
            case .fibonacci: value = fibonacci(first: Int(first)!)
        }
        presenter?.didGet(value: value)
    }
    
    func sum(first: Int, second: Int) -> String {
        return String(first+second)
    }
    
    func multiply(first: Int, second: Int) -> String {
        return String(first*second)
    }
    
    func prime(first: Int) -> String {
        if first == 0 {return ""}
        var primes = ["2","3","5","7"]
        var initial = 4
        while primes.count < first {
            if !(initial % 2 == 0 || initial % 3 == 0 || initial % 5 == 0 || initial % 7 == 0) {
                primes.append(String(initial))
            }
            
            initial = initial + 1
        }
        if first < 4 {
            primes = Array(primes.prefix(first))
        }
        return primes.joined(separator: ", ")
    }
    
    func fibonacci(first: Int) -> String {
        if first == 0 {return ""}
        var fibs = [0, 1]
        while fibs.count < first {
            let limit = fibs.count - 1
            let newVal = fibs[limit] + fibs[limit-1]
            fibs.append(newVal)
        }
        if first < 2 {
            fibs = Array(fibs.prefix(first))
        }
        let sfibs = fibs.map { "\($0)" }.joined(separator: ", ")
        return sfibs
    }

}
