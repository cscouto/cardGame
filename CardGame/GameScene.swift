//
//  GameScene.swift
//  CardGame
//
//  Created by Couto on 10/25/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        let model = Card(suit: .Clubs, rank: .ace)
        let card = CardNode(card: model)
        card.position = CGPoint(x: 0, y: 0)
        self.addChild(card)
    }
}
