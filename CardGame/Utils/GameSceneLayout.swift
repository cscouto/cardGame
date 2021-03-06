//
//  GameSceneLayout.swift
//  CardGame
//
//  Created by Tiago Do Couto on 12/10/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import UIKit

class GameSceneLayout {
    static var peakOffSetY:CGFloat = 80.0
    static var offSetBetweenCards:CGFloat = 2.0
    static var cardSizeMultiplier = 0.75
    static var cardSize: CGSize = CGSize(
        width: 77 * cardSizeMultiplier,
        height: 104 * cardSizeMultiplier
    )
}
