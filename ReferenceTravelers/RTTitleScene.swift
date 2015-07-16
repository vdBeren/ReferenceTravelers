//
//  RTTitleScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

var audioNode: RTAudio? = RTAudio()
var backgroundNode: RTBackground?

class RTTitleScene: SKScene {
   
    var nextScene: RTHeroSelectionScene?
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        //Node de Audio
        //        addChild(audioNode!)
        //        audioNode!.playMusic(RTAudio.MusicsEnum.Title)
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bg0")
        backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        addChild(backgroundNode!)

        
        nextScene = RTHeroSelectionScene(size: size)
        
        
    }
    
    //Chamado a todo frame. Usado para realizar o update dos nodes da Scene, em cascata.
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
    }
    
    
    //Recebe toques na Scene.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.runAction(SKAction.waitForDuration(0.2))
        let endTransition = SKTransition.pushWithDirection(SKTransitionDirection.Left, duration: 1.5)
        self.scene?.view?.presentScene(nextScene, transition: endTransition)
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
