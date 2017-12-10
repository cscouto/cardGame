//
//  Card.swift
//  CardGame
//
//  Created by Tiago Do Couto on 12/10/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import Foundation

class Card {
    
    var suit: Suit
    var rank: Rank
    var asset: String {
        get {
            return "card"+self.suit.rawValue+rank.stringValue()
        }
    }
    
    init(suit: Suit, rank: Rank) {
        self.rank = rank
        self.suit = suit
    }
}
