//
//  RTHeroSelectionScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


class RTHeroSelectionScene: SKScene {
    
    var buttonNodeRight, buttonNodeLeft: RTButton?
    var backgroundNode: RTBackground?
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "background1")
        backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        self.addChild(backgroundNode!)
        
        
        buttonNodeLeft = RTButton(imageNamed: "btnArrowEsq", actionOnTouchBegan: true)
        buttonNodeLeft!.position = CGPoint(x: 0.0, y: 0.0)
        buttonNodeLeft!.alpha = 0.3
        
        //BLOCO DE AÇÃO DO BOTÃO
        buttonNodeLeft?.setRTButtonAction({ () -> () in
            self.runAction(SKAction.waitForDuration(0.2))
            let transition = SKTransition.pushWithDirection(SKTransitionDirection.Right, duration: 1.5)
            self.scene?.view?.presentScene(GTitleScene, transition: transition)
        })
        self.addChild(buttonNodeLeft!)
        
        buttonNodeRight = RTButton(imageNamed: "btnArrowDir", actionOnTouchBegan: true)
        buttonNodeRight!.position = CGPoint(x: size.width - buttonNodeRight!.size.width, y: size.height - buttonNodeRight!.size.height)
        buttonNodeRight!.alpha = 0.3
        
        //BLOCO DE AÇÃO DO BOTÃO
        buttonNodeRight?.setRTButtonAction({ () -> () in
            self.runAction(SKAction.waitForDuration(0.2))
            let transition = SKTransition.pushWithDirection(SKTransitionDirection.Left, duration: 1.5)
            self.scene?.view?.presentScene(GStageSelectionScene, transition: transition)
        })
        self.addChild(buttonNodeRight!)
        
        
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
