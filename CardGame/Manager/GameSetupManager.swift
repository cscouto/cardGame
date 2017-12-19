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
    private var openedCards: [CardNode] = []
    var leftPeak: [CardNode] {
        get{
            return self.gameScene!.leftPeak
        }
        set{
            self.gameScene?.leftPeak = newValue
        }
    }
    var centerPeak: [CardNode] {
        get{
            return self.gameScene!.centerPeak
        }
        set{
            self.gameScene?.centerPeak = newValue
        }
    }
    var rightPeak: [CardNode] {
        get{
            return self.gameScene!.rightPeak
        }
        set{
            self.gameScene?.rightPeak = newValue
        }
    }
    
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
    func setupOpenCards(){
        let lastCard = rightPeak.last!
        let yPos = lastCard.position.y - lastCard.size.height / 2
        var xPos = lastCard.position.x + lastCard.size.width / 2
        for _ in 0...9{
            let openCard = self.createCard(x: xPos, y: yPos)
            //xPos -= GameSceneLayout.offSetBetweenCards * 2
            xPos -= lastCard.size.width + GameSceneLayout.offSetBetweenCards
            self.openedCards.append(openCard)
        }
        self.openedCards = self.openedCards.reversed()
        self.addCardsToPeak(peak: &self.leftPeak, offSet: 0)
        self.addCardsToPeak(peak: &self.centerPeak, offSet: 3)
        self.addCardsToPeak(peak: &self.rightPeak, offSet: 6)
    }
    func addCardsToPeak( peak: inout [CardNode], offSet: Int){
        let numberOfCards = 4
        for i in offSet..<offSet+numberOfCards {
            let openedCard = self.openedCards[i]
            peak.append(openedCard)
        }
    }
    func setupPeak(){
        let offSetY = (self.gameScene!.size.height/2) - GameSceneLayout.peakOffSetY
        let centerX:CGFloat = 0.0
        let dummyCard = CardNode()
        var leftX = centerX - dummyCard.size.width * 3
        leftX -= GameSceneLayout.offSetBetweenCards * 6
        var rightX = centerX + dummyCard.size.width * 3
        rightX += GameSceneLayout.offSetBetweenCards * 6
        self.centerPeak = self.setupPeakWithTopPositionAtPoint(point: CGPoint(x: centerX, y: offSetY))
        self.leftPeak = self.setupPeakWithTopPositionAtPoint(point: CGPoint(x: leftX, y: offSetY))
        self.rightPeak = self.setupPeakWithTopPositionAtPoint(point: CGPoint(x: rightX, y: offSetY))
        setupOpenCards()
    }
}
