//
//  CardRank.swift
//  CardGame
//
//  Created by Tiago Do Couto on 12/10/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import Foundation

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func stringValue() -> String {
        switch self {
        case .Ace:
            return "A"
        case .Jack:
            return "J"
        case .King:
            return "K"
        case .Queen:
            return "Q"
        default:
            return String(self.rawValue)
        }
    }
    
    static let allValues = [
        Rank.Ace,
        Rank.Two,
        Rank.Three,
        Rank.Four,
        Rank.Five,
        Rank.Six,
        Rank.Seven,
        Rank.Eight,
        Rank.Nine,
        Rank.Ten,
        Rank.Jack,
        Rank.Queen,
        Rank.King
    ]
}
