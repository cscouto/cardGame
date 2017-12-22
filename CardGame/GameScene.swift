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
    var peakCards: [CardNode] {
        get{
            let peak = leftPeak+centerPeak+rightPeak
            return peak.sorted{$0.position.y < $1.position.y}
        }
    }
    
    //system functions
    override func didMove(to view: SKView) {
        let manager = GameSetupManager(gameScene: self)
        self.manager = manager
        self.manager?.setup()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self)
        for card: CardNode in self.peakCards {
            if card.contains(point!){
                card.remove()
                
                removeCardFromPeak(peak: &leftPeak, card: card)
                removeCardFromPeak(peak: &centerPeak, card: card)
                removeCardFromPeak(peak: &rightPeak, card: card)
                return
            }
        }
    }
    
    //custom functions
    func removeCardFromPeak(peak: inout [CardNode], card: CardNode){
        if let index = peak.index(of: card) {
            peak.remove(at: index)
        }
    }
    
}
