//
//  GameFlowManager.swift
//  CardGame
//
//  Created by Tiago Do Couto on 12/22/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import SpriteKit

class GameFlowManager {
    //vars
    private weak var gameScene: GameScene?
    var leftPeak: [CardNode] {
        get {
            return gameScene!.leftPeak
        }
        set{
            self.gameScene!.leftPeak = newValue
        }
    }
    var rightPeak: [CardNode] {
        get {
            return gameScene!.rightPeak
        }
        set{
            self.gameScene!.rightPeak = newValue
        }
    }
    var centerPeak: [CardNode] {
        get {
            return gameScene!.centerPeak
        }
        set{
            self.gameScene!.centerPeak = newValue
        }
    }
    var peakCards: [CardNode] {
        get{
            let peak = leftPeak+centerPeak+rightPeak
            return peak.sorted{$0.position.y < $1.position.y}
        }
    }
    
    //system functions
    init(gameScene: GameScene){
        self.gameScene = gameScene
    }
    
    //custom functions
    func handleTouchStart(point: CGPoint){
        for card: CardNode in self.peakCards {
            if card.contains(point){
                card.remove()
                removeCardFromPeak(peak: &leftPeak, card: card)
                removeCardFromPeak(peak: &centerPeak, card: card)
                removeCardFromPeak(peak: &rightPeak, card: card)
                return
            }
        }
    }
    func removeCardFromPeak(peak: inout [CardNode], card: CardNode){
        if let index = peak.index(of: card) {
            peak.remove(at: index)
        }
    }
}
