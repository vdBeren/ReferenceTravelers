//
//  GameViewController.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

var GAudioNode: RTAudio? = RTAudio()
var GTitleScene: RTTitleScene?
var GHeroSelectionScene: RTHeroSelectionScene?
var GStageSelectionScene: RTStageSelectionScene?
var GCombatScene: RTCombatScene?

class GameViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        var size = skView.bounds.size
        //INICIALIZA TODAS AS SCENES DE MENUS
        GTitleScene = RTTitleScene(size: size)
        GHeroSelectionScene = RTHeroSelectionScene(size: size)
        GStageSelectionScene = RTStageSelectionScene(size: size)
        GCombatScene = RTCombatScene(size: size)
        
        /* Set the scale mode to scale to fit the window */
        GTitleScene!.scaleMode = .AspectFill
        
        skView.presentScene(GHeroSelectionScene)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
