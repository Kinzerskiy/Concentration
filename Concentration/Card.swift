//
//  Card.swift
//  Concentration
//
//  Created by Egor on 28.06.2022.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifire: Int
    
    static var identifireNumber = 0
    
    static func identifireGenerator() -> Int {
        identifireNumber += 1
        return identifireNumber
    }
    
    init() {
        self.identifire = Card.identifireGenerator()
    }
}
