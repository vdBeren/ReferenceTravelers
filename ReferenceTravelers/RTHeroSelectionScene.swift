//
//  RTHeroSelectionScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe da cena de seleção de Heroi. Possui um Selection Menu e uma Text Window.

class RTHeroSelectionScene: SKScene {
    
    var backgroundNode: RTBackground?
    var selectionMenu: RTSelectionMenu?
    var textWindow: RTHeroTextWindow?
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bgHeroSelection")
        backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        self.addChild(backgroundNode!)
        
        // Text Window
        textWindow = RTHeroTextWindow()
        self.addChild(textWindow!)
        
        // Selection Menu
        let arrayImageNames = ["btnSelectionLeft", "btnSelectionRight", "btnText", "barText"]
        let arrayText = ["HIRE", "CHOOSE"]
        let colors = [SKColor.orangeColor(), SKColor.whiteColor()]
        
        selectionMenu = RTSelectionMenu(objectArray: GHeroesManager!.heroArray, buttonsImageNames: arrayImageNames, selectButtonTexts: arrayText, colors: colors)
        self.buildSelectionMenu()
        self.addChild(selectionMenu!)
        
        self.userInteractionEnabled = false

    }
    
    func restoreScene(){
        
        let alpha = SKAction.fadeAlphaTo(1.0, duration: 0.8)
        
        let blockHidden = SKAction.runBlock({
            self.textWindow?.runAction(alpha)
            self.selectionMenu?.runAction(alpha)
            self.selectionMenu?.userInteractionEnabled = true
        })
        
        self.runAction(blockHidden)
        
    }
    
    func returningFromStage(){
        
        let zoom = SKAction.scaleTo(1.0, duration: 1.0)
        let move = SKAction.moveByX(880, y: 630, duration: 1.0)
        let group = SKAction.group([zoom, move])
        
        let block = SKAction.runBlock({self.restoreScene()})
        let sequence = SKAction.sequence([group, block])
        
        self.backgroundNode!.runAction(sequence)
    }
    
    // Constroi o menu de seleção
    private func buildSelectionMenu(){
        
        
        selectionMenu?.setRTChangeSelectionAction({ () -> () in
            let selectionIndex: Int = self.selectionMenu!.selectionIndex
            let selectionHero: RTSelectable = self.selectionMenu!.objectArray[selectionIndex]
            
            GHeroesManager!.currentHero = (selectionHero as? RTHero)!
            self.textWindow!.refreshContents()
            
            GAudioManager!.playSound(RTAudioManager.SoundsEnum.Blop)
            
        })
        
        selectionMenu?.setRTSelectButton({ () -> () in
            
            let alpha = SKAction.fadeAlphaTo(0.0, duration: 0.4)
            
            self.selectionMenu?.userInteractionEnabled = false

            
            let blockHidden = SKAction.runBlock({
                self.textWindow?.runAction(alpha)
                self.selectionMenu?.runAction(alpha)
            })
            
            let wait = SKAction.waitForDuration(0.8)
            
            let sequenceHidden = SKAction.sequence([blockHidden, wait])
            
            self.runAction(sequenceHidden)
            
            
            let zoom = SKAction.scaleTo(2.5, duration: 1.0)
            let move = SKAction.moveByX(-880, y: -630, duration: 1.0)
            let group = SKAction.group([zoom, move])
            
            let block = SKAction.runBlock({
                
                let transition = SKTransition.pushWithDirection(SKTransitionDirection.Up, duration: 1.5)
                self.scene?.view?.presentScene(GStageSelectionScene, transition: transition)
            })
            
            let sequence = SKAction.sequence([group, block])
            
            self.backgroundNode!.runAction(sequence)

        })
        
        var sizeW = self.size.width
        var sizeH = self.size.height
        
        selectionMenu!.btnLeft?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnLeft!.position = CGPoint(x: sizeW/3.1, y: sizeH/1.7)
        
        selectionMenu!.btnRight?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnRight!.position = CGPoint(x: sizeW/1.45, y: sizeH/1.7)
        
        selectionMenu!.btnSelect?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnSelect!.position = CGPoint(x: sizeW/2, y: sizeH/2.6)
        
        selectionMenu!.selectableDisplay?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.selectableDisplay?.position = CGPoint(x: sizeW/2, y: sizeH/1.75)
        
        
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
