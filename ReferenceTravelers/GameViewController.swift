//
//  GameViewController.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

//VARIAVEIS GLOBAIS

var GAudioNode: RTAudio? = RTAudio()
var GEventManager: RTEventManager? = RTEventManager()
var GTileManager: RTTileManager? = RTTileManager()
var GHeroesManager: RTHeroManager? = RTHeroManager()
var GStageManager: RTStageManager? = RTStageManager()

var GTitleScene: RTTitleScene?
var GHeroSelectionScene: RTHeroSelectionScene?
var GStageSelectionScene: RTStageSelectionScene?
var GBoardScene: RTBoardScene?
var GCombatScene: RTCombatScene?
var GSettingsScene: RTSettingsScene?

var GGold: Int = NSUserDefaults.standardUserDefaults().integerForKey("playergold")

class GameViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = self.view as! SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        //skView.ignoresSiblingOrder = true
        
        var size = skView.bounds.size
        
        //INICIALIZA TODAS AS SCENES
        GTitleScene = RTTitleScene(size: size)
        GHeroSelectionScene = RTHeroSelectionScene(size: size)
        GStageSelectionScene = RTStageSelectionScene(size: size)
        
        GBoardScene = RTBoardScene(size: size)
        GCombatScene = RTCombatScene(size: size)
        GSettingsScene = RTSettingsScene(size: size)
        
        /* Set the scale mode to scale to fit the window */
        GBoardScene!.scaleMode = .AspectFill
        
        GTitleScene!.scaleMode = .AspectFill
        
        skView.presentScene(GTitleScene!)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
