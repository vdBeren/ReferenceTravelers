//
//  RTSelectionMenu.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe que controla visualmente um array, permitindo percorre-lo e selecionar itens a partir de botões.
// As posições de seus objetos devem ser definidas na classe pai.

class RTSelectionMenu: RTHideRequired {
   
    var btnLeft, btnRight, btnSelect: RTButton?
    var objectArray: [RTSelectable] = []
    var selectionIndex: Int = 0
    var labelObjectName: RTLabel?
    var selectableDisplay: RTSelectable?
    
    init(objectArray: [RTSelectable]){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: "NOTHING")
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "SELECTIONMENU"
        self.userInteractionEnabled = true
        
        self.objectArray = objectArray
        
        self.btnLeft = RTButton(imageNamed: "btnSelectionLeft", actionOnTouchBegan: false)
        self.btnLeft?.setRTButtonAction({ () -> () in
            self.buttonLeftAction()
        })
        self.addChild(self.btnLeft!)
        
        self.btnRight = RTButton(imageNamed: "btnSelectionRight", actionOnTouchBegan: false)
        self.btnRight?.setRTButtonAction({ () -> () in
            self.buttonRightAction()
        })
        self.addChild(self.btnRight!)
        
        self.btnSelect = RTButton(imageNamed: "", actionOnTouchBegan: false)
        self.btnSelect?.setRTButtonAction({ () -> () in
            self.buttonSelectAction()
        })
        self.addChild(self.btnSelect!)
        
        self.labelObjectName = RTLabelText(text: "NAME", fontSize: 22, minimum: 5)
        self.labelObjectName?.fontColor = SKColor.orangeColor()
        self.addChild(self.labelObjectName!)
        
        self.selectableDisplay = RTSelectable(imageNamed: objectArray[0].imageName)
        self.addChild(self.selectableDisplay!)
    
    }
    
    private func buttonSelectAction(){
        if self.objectArray[self.selectionIndex].locked{
            // POP UP COMPRAR / SOM DE DENIED
        }
        else{
            self.objectArray[self.selectionIndex].selected = true
            
        }
        
    }
    
    private func buttonRightAction(){
        println("RIGHT")
        self.chanceSelection(1)
    }
    
    private func buttonLeftAction(){
        println("LEFT")
        self.chanceSelection(-1)
    }

    private func chanceSelection(value: Int){
        
        if value <= 1{
            self.selectionIndex += value
            if value == 1{
                self.changeSelectionAnimation(true)
            }
            else{
                self.changeSelectionAnimation(false)
            }
        }
        else{
            self.selectionIndex = value
        }
        
        
        if selectionIndex > objectArray.count-1{
            selectionIndex = 0
        }
        
        if selectionIndex < 0{
            selectionIndex = objectArray.count-1
        }
        
    }
    
    private func changeSelectionAnimation(left: Bool){
        
        var moveX: CGFloat = 150.0
        var blinkX: CGFloat = moveX * 2
        
        if left{
            moveX *= -1
        }
        else{
            blinkX *= -1
        }

        let move = SKAction.moveByX(moveX, y: 0.0, duration: 0.4)
        let blink = SKAction.moveByX(blinkX, y: 0.0, duration: 0.0)
        
        let fadeOut = SKAction.fadeAlphaTo(0.0, duration: 0.4)
        let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 0.4)
        
        let changeTexture = SKAction.runBlock({self.changeSelectableDisplayTexture()})
        
        let sequence = SKAction.sequence([move, blink, move])
        let sequenceFade = SKAction.sequence([fadeOut, changeTexture, fadeIn])
        
        self.selectableDisplay!.runAction(sequenceFade)
        self.selectableDisplay!.runAction(sequence)
        
    }
    
    
    private func changeSelectableDisplayTexture(){
        
        var locked: SKAction
        var alpha: SKAction
        var sequence: SKAction
        
        if self.objectArray[self.selectionIndex].locked{
            locked = SKAction.colorizeWithColor(SKColor.blackColor(), colorBlendFactor: 1.0, duration: 0.0)
            alpha = SKAction.fadeAlphaTo(0.3, duration: 0.0)
            sequence = SKAction.sequence([locked, alpha])
        }
        else{
            locked = SKAction.colorizeWithColor(SKColor.clearColor(), colorBlendFactor: 0.0, duration: 0.0)
            alpha = SKAction.fadeAlphaTo(1.0, duration: 0.0)
            sequence = SKAction.sequence([locked, alpha])
        }
        selectableDisplay!.runAction(sequence)
        selectableDisplay?.texture = self.objectArray[self.selectionIndex].texture!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
