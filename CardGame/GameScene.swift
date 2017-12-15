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
    
    //vars
    private var manager: GameSetupManager?
    var leftPeak: [CardNode] = []
    var centerPeak: [CardNode] = []
    var rightPeak: [CardNode] = []
    
    override func didMove(to view: SKView) {
        let manager = GameSetupManager(gameScene: self)
        self.manager = manager
        self.manager?.setup()
    }
}
