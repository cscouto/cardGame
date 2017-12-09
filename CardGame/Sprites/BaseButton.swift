//
//  BaseButton.swift
//  CardGame
//
//  Created by Couto on 11/8/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

typealias ObjectSelectorPair = (object: Container<NSObject>, selector: Selector)

import SpriteKit

class BaseButton: SKSpriteNode {
    
    var hover: Bool = false {
        didSet {
            self.updateHover(animated: true, hover: self.hover)
        }
    }
    
    private var targets: [ObjectSelectorPair] = [ObjectSelectorPair]()
    
    func addTarget(target: NSObject, selector: Selector) {
        let weakTarget = Container(value: target)
        self.targets.append((object: weakTarget, selector: selector))
    }
    
    func removeTarget(target: NSObject, selector: Selector) {
        var index: Int = 0
        for objectSelectorPair: ObjectSelectorPair in self.targets {
            let obj = objectSelectorPair.object
            let sel = objectSelectorPair.selector
            if obj.value == target && sel == selector {
                self.targets.remove(at: index)
            }
            index+=1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.hover = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.hover = false
        let touch = touches.first!
        if let parent = self.parent {
            let point = touch.location(in: parent)
            if self.contains(point) {
                self.handlePress()
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if let parent = self.parent {
            let point = touch.location(in: parent)
            if self.contains(point) {
                self.hover = true
            } else {
                self.hover = false
            }
        }
    }
    
    func handlePress() {
        for objectSelectorPair: ObjectSelectorPair in self.targets {
            let obj = objectSelectorPair.object
            let sel = objectSelectorPair.selector
            obj.value?.perform(sel)
        }
    }
    
    func updateHover(animated: Bool, hover: Bool) {
        var alpha: CGFloat = 1.0
        if !hover {
            alpha = 0.2
        }
        if animated {
            let action: SKAction = SKAction.fadeAlpha(to: alpha, duration: 0.1)
            self.run(action)
        } else {
            self.alpha = alpha
        }
    }
    
}
