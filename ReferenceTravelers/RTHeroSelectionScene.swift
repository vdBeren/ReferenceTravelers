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
    var selectionMenu: RTSelectionMenu?
    var textWindow: RTTextWindow?
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bgHeroSelection")
        backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        self.addChild(backgroundNode!)
        
        // Text Window
        textWindow = RTTextWindow()
        self.addChild(textWindow!)
        
        // Selection Menu
        selectionMenu = RTSelectionMenu(objectArray: GHeroesManager!.heroArray)
        self.buildSelectionMenu()
        self.addChild(selectionMenu!)
        
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
        
        self.userInteractionEnabled = false

    }
    
    private func buildSelectionMenu(){
        
        var sizeW = self.size.width
        var sizeH = self.size.height
        
        selectionMenu!.btnLeft?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnLeft!.position = CGPoint(x: sizeW/4, y: sizeH/2)
        
        selectionMenu!.btnRight?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnRight!.position = CGPoint(x: sizeW/1.5, y: sizeH/2)
        
        selectionMenu!.btnSelect?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnSelect!.position = CGPoint(x: sizeW/2, y: sizeH/4)
        
        selectionMenu!.selectableDisplay?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.selectableDisplay?.position = CGPoint(x: sizeW/2, y: sizeH/2)
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
