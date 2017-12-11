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
    func setupPeakWithTopPositionAtPoint(point: CGPoint) -> [CardNode] {
        let offset = GameSceneLayout.offSetBetweenCards
        var x: CGFloat = 0
        var y:CGFloat = 0
        
        //top card
        x = point.x
        y = point.y
        let topCard = self.createCard(x: x, y: y)
        
        //second row
        x = topCard.position.x - topCard.size.width/2 - offset
        y = topCard.position.y - topCard.size.height/2
        let centerLeftCard = self.createCard(x: x, y: y)
        x = topCard.position.x + topCard.size.width/2 + offset
        let centerRightCard = self.createCard(x: x, y: y)
        
        //bottom cards
        x = centerLeftCard.position.x - centerLeftCard.size.width/2 - offset
        y = centerLeftCard.position.y - centerLeftCard.size.height/2
        let bottomLeftCard = self.createCard(x: x, y: y)
        x = topCard.position.x
        let bottomCenterCard = self.createCard(x: x, y: y)
        x = centerRightCard.position.x + centerRightCard.size.width/2 + offset
        let bottomRightCard = self.createCard(x: x, y: y)
        
        return [topCard, centerLeftCard, centerRightCard, bottomLeftCard, bottomCenterCard, bottomRightCard]
    }
    func createCard(x: CGFloat, y: CGFloat) -> CardNode {
        let card = CardNode(card: self.getRandomCard())
        card.position = CGPoint(x: x, y: y)
        self.gameScene?.addChild(card)
        return card
    }
    func setupPeak(){
        _ = self.setupPeakWithTopPositionAtPoint(point: CGPoint(x: 0, y: 30))
    }
}
