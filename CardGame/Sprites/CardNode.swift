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
    var size: CGSize = GameSceneLayout.cardSize
    
    override init(){
        super.init()
    }
    
    init(card: Card) {
        super.init()
        self.card = card
        let front = SKSpriteNode(imageNamed: card.asset)
        front.size = size
        self.addChild(front)
        self.front = front
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
