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
        
        let myLabel = SKLabelNode(
            fontNamed: FontType.HelveticaNeueLight.rawValue
        )
        myLabel.text = "Hello, World"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(
            x:self.frame.midX,
            y:self.frame.midY
        )
        
        self.addChild(myLabel)
    }
}
