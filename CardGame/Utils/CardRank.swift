//
//  CardRank.swift
//  CardGame
//
//  Created by Tiago Do Couto on 12/10/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import Foundation

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func stringValue() -> String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .king:
            return "K"
        case .queen:
            return "Q"
        default:
            return String(self.rawValue)
        }
    }
}
