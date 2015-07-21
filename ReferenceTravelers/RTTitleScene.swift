//
//  RTTitleScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

var backgroundNode: RTBackground?

class RTTitleScene: SKScene {
    
    var buttonNodeRight: RTButton?
    var gamePad: RTGamePad?
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        //Node de Audio
        //        addChild(audioNode!)
        //        audioNode!.playMusic(RTAudio.MusicsEnum.Title)
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bg0")
        backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        self.addChild(backgroundNode!)
        
        
        buttonNodeRight = RTButton(imageNamed: "btnArrowDir")
        buttonNodeRight!.position = CGPoint(x: size.width - buttonNodeRight!.size.width, y: size.height - buttonNodeRight!.size.height)
        buttonNodeRight!.alpha = 0.3
        
        //BLOCO DE AÇÃO DO BOTÃO
        buttonNodeRight?.setRTButtonAction({ () -> () in
            self.runAction(SKAction.waitForDuration(0.2))
            let transition = SKTransition.pushWithDirection(SKTransitionDirection.Left, duration: 1.5)
            self.scene?.view?.presentScene(GHeroSelectionScene, transition: transition)
        })
        self.addChild(buttonNodeRight!)
        
        gamePad = RTGamePad()
        self.addChild(gamePad!)
        
        self.userInteractionEnabled = false
        
        
        
    }
    
    //Chamado a todo frame. Usado para realizar o update dos nodes da Scene, em cascata.
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
    }
    
    
    //Recebe toques na Scene.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
