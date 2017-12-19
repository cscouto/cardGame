//
//  CardNode.swift
//  CardGame
//
//  Created by Tiago Do Couto on 12/10/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import SpriteKit

class CardNode: SKNode {
    //vars
    var open: Bool = false {
        didSet{
            self.handleOpenClosed()
        }
    }
    override var description: String {
        return "\(self.card!.rank) of \(self.card!.suit)"
    }
    var card: Card?
    weak var front: SKSpriteNode?
    weak var back: SKSpriteNode?
    var size: CGSize = GameSceneLayout.cardSize
    
    //initializers
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
        let back = SKSpriteNode(imageNamed: self.cardBackWithColor(.red, type: .Type4))
        back.size = size
        self.addChild(back)
        self.back = back
        self.handleOpenClosed()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //custom functions
    func cardBackWithColor(_ color: BackCard, type: BackCardType) -> String {
        return "cardBack_" + color.rawValue + String(type.rawValue)
    }
    func handleOpenClosed(){
        if open {
            self.front!.isHidden = false
            self.back!.isHidden = true
        }else{
            self.front!.isHidden = true
            self.back!.isHidden = false
        }
    }
}
