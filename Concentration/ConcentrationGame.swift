//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Egor on 28.06.2022.
//

import Foundation
class ConcentrationGame {
    
    var cards = [Card]()
    
    var indexsOfOneOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexsOfOneOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifire == cards[index].identifire {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexsOfOneOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexsOfOneOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}
