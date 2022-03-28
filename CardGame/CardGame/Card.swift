//
//  Card.swift
//  CardGame
//
//  Created by 1 on 3/27/22.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identiefier: Int
    
    static var idententifierNumber = 0
    
    static func identifierGenerator() -> Int{
        idententifierNumber += 1
        
        return 0
    }
    
    init() {
        self.identiefier = Card.identifierGenerator() 
    }
    
}
