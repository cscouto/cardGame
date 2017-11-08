//
//  GameViewController.swift
//  CardGame
//
//  Created by Couto on 10/25/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.size =  view.frame.size
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
