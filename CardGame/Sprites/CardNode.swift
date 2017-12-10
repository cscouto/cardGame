//
//  CardNode.swift
//  CardGame
//
//  Created by Tiago Do Couto on 12/10/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import SpriteKit

class CardNode: SKNode {
    
    var card: Card?
    weak var front: SKSpriteNode?
    
    init(card: Card) {
        super.init()
        self.card = card
        let front = SKSpriteNode(imageNamed: card.asset)
        self.addChild(front)
        self.front = front
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
