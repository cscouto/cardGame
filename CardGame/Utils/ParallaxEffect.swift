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
    
    override func keyPathsAndRelativeValues(forViewerOffset viewerOffset: UIOffset) -> [String : Any]? {
            
            let values = super.keyPathsAndRelativeValues(
                forViewerOffset: viewerOffset
            )
            if let delegate = self.delegate {
                delegate.keyPathsAndRelativeValuesForViewerOffset(values: values as [String : AnyObject]?)
            }
            
        return values! as [String : AnyObject]
    }
    
}
