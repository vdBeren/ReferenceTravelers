//
//  RTStageSelectionScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe da cena de Fases. Possui um Selection Menu e uma Text Window.

class RTStageSelectionScene: SKScene {
    
    var btnBack: RTBoingButton?
    var backgroundNode: RTBackground?
    var selectionMenu: RTSelectionMenu?
    var textWindow: RTStageTextWindow?
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bgStageSelection")
        backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        self.addChild(backgroundNode!)

        
        // Selection Menu
        
        let arrayImageNames = ["btnSelectionLeft", "btnSelectionRight", "hologramLight", "barText"]
        let arrayText = ["RESEARCH", "TRAVEL!"]
        let colors = [SKColor.whiteColor(), SKColor.clearColor()]
        
        selectionMenu = RTSelectionMenu(objectArray: GStageManager!.stageArray, buttonsImageNames: arrayImageNames, selectButtonTexts: arrayText, colors: colors)
        self.buildSelectionMenu()
        self.addChild(selectionMenu!)
        
        // Text Window
        textWindow = RTStageTextWindow()
        textWindow?.zPosition += 1
        self.addChild(textWindow!)
        
        btnBack = RTBoingButton(imageNamed: "btnBack", actionOnTouchBegan: true, actionTime: 1.0)
        self.btnBack!.position = CGPoint(x: self.size.width/30, y: self.size.height/1.1)
        self.btnBack!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        btnBack?.zPosition += 1
        
        //BLOCO DE AÇÃO DO BOTÃO
        btnBack?.setRTButtonAction({ () -> () in
            let block = SKAction.runBlock({
                GHeroSelectionScene!.returningFromStage()
                let transition = SKTransition.pushWithDirection(SKTransitionDirection.Down, duration: 1.5)
                self.scene?.view?.presentScene(GHeroSelectionScene, transition: transition)
            })
            
            let wait = SKAction.waitForDuration(0.3)
            let sequence = SKAction.sequence([wait, block])
            
            self.runAction(sequence)

        })
        self.addChild(btnBack!)
        
        
    }
    
    private func buildSelectionMenu(){
        
        selectionMenu?.setRTChangeSelectionAction({ () -> () in
            let selectionIndex: Int = self.selectionMenu!.selectionIndex
            let selectionStage: RTSelectable = self.selectionMenu!.objectArray[selectionIndex]
            
            GStageManager!.currentStage = (selectionStage as? RTStage)!
            self.textWindow!.refreshContents()
            
        })
        
        selectionMenu?.setRTSelectButton({ () -> () in
            self.runAction(SKAction.waitForDuration(0.2))
            let transition = SKTransition.pushWithDirection(SKTransitionDirection.Down, duration: 1.5)
            self.scene?.view?.presentScene(GBoardScene, transition: transition)
        })
        
        var sizeW = self.size.width
        var sizeH = self.size.height
        
        selectionMenu!.btnLeft?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnLeft!.position = CGPoint(x: sizeW/6.5, y: sizeH/1.5)
        
        selectionMenu!.btnRight?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnRight!.position = CGPoint(x: sizeW/1.61, y: sizeH/1.5)
        
        selectionMenu!.btnSelect?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnSelect?.position = CGPoint(x: sizeW/1.18, y: sizeH/1.7)
        selectionMenu!.btnSelect?.labelText?.fontSize = 45.0
        selectionMenu!.btnSelect?.labelText?.position.y += 40
        
        let hologramPad = SKSpriteNode(imageNamed: "hologramPad")
        hologramPad.position.y -= 300
        selectionMenu!.btnSelect?.addChild(hologramPad)
        
        selectionMenu!.selectableDisplay?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.selectableDisplay?.position = CGPoint(x: sizeW/2.613, y: sizeH/1.507)
        
        selectionMenu!.labelObjectName?.hidden = true
        selectionMenu!.labelObjectName?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.labelObjectName?.position = CGPoint(x: sizeW/2, y: sizeH/1.3)

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
