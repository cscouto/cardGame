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
    private var gameFlowManager: GameFlowManager?
    var leftPeak: [CardNode] = []
    var centerPeak: [CardNode] = []
    var rightPeak: [CardNode] = []

    
    //system functions
    override func didMove(to view: SKView) {
        let manager = GameSetupManager(gameScene: self)
        self.manager = manager
        self.manager?.setup()
        self.gameFlowManager = GameFlowManager(gameScene: self)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self)
        gameFlowManager?.handleTouchStart(point: point!)
    }
    
}
