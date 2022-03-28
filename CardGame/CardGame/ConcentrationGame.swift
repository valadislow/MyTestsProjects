 //
//  ConcentrationGame.swift
//  CardGame
//
//  Created by 1 on 3/27/22.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    
    var indexOfOneFaceCard: Int?
    
    func choosecard(at index: Int) {
        if !cards[index].isMatched{
            if let matchingIndex = indexOfOneFaceCard, matchingIndex != index{
                if cards[matchingIndex].identiefier == cards[index].identiefier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneFaceCard = nil
            } else {
                for flipDown in cards.indices{
                    cards [flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneFaceCard = index
            } 
        }
    }
    
    init(numberOfPairs: Int){
        for _ in 1...numberOfPairs{
            let card = Card()
            cards += [card, card]
        }
    }
}
