//
//  ParallaxEffect.swift
//  CardGame
//
//  Created by Couto on 11/8/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import UIKit

protocol ParallaxEffectDelegate {
    func keyPathsAndRelativeValuesForViewerOffset(values: [String : AnyObject]?)
}

class ParallaxEffect: UIInterpolatingMotionEffect {
    
    var delegate: ParallaxEffectDelegate?
    
    override func keyPathsAndRelativeValuesForViewerOffset(
        viewerOffset: UIOffset) -> [String : AnyObject]? {
        
        let values = super.keyPathsAndRelativeValuesForViewerOffset(
            viewerOffset
        )
        if let delegate = self.delegate {
            delegate.keyPathsAndRelativeValuesForViewerOffset(values)
        }
        
        return values
    }
    
}
