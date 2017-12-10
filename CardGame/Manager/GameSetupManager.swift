//
//  GameSetupManager.swift
//  CardGame
//
//  Created by Tiago Do Couto on 12/10/17.
//  Copyright © 2017 coutocode. All rights reserved.
//
import SpriteKit

class GameSetupManager {
    
    private weak var gameScene: GameScene?
    private var cardDeck: [Card] = []
    
    init(gameScene: GameScene) {
        self.gameScene = gameScene
    }
    
    func setup(){
        self.createDeck()
        self.setupPeak()
    }
    func createDeck(){
        for suit: Suit in Suit.allValues {
            for rank: Rank in Rank.allValues {
                self.cardDeck.append(Card(suit: suit, rank: rank))
            }
        }
    }
    func getRandomCard() -> Card {
        let index = UInt32(self.cardDeck.count)
        let randomIndex = Int(arc4random_uniform(index))
        let cardReturn = self.cardDeck[randomIndex]
        self.cardDeck.remove(at: randomIndex)
        return cardReturn
    }
    func setupPeak(){}
}
