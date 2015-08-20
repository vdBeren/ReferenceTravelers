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
// As posições de seus componentes devem ser definidas na classe pai.
// OBJETOS: [btnLeft, btnRight, btnSelect, labelObjectName, selectableDisplay]

class RTSelectionMenu: SKNode {
   
    var btnLeft, btnRight: RTBoingButton?
    var btnSelect, labelObjectName: RTTextButton?
    var selectableDisplay: RTSelectable?

    var objectArray: [RTSelectable] = []
    var selectionIndex: Int = 0
    
    var changeSelectionAction: (Void) -> (Void) = {}
    var selectButtonAction: (Void) -> (Void) = {}
    
    var buttonsImageNames: [String] = []
    var selectButtonTexts: [String] = []
    
    var colors: [SKColor] = []
    
    var fontSize: CGFloat = 26.0
    
    
    init(objectArray: [RTSelectable], buttonsImageNames: [String], selectButtonTexts: [String], colors: [SKColor]){
        
        super.init()
        
        self.name = "SELECTIONMENU"
        self.userInteractionEnabled = true
        
        self.objectArray = objectArray
        
        self.buttonsImageNames = buttonsImageNames
        self.selectButtonTexts = selectButtonTexts
        
        self.colors = colors
        
        self.initSelectionMenu()
    
    }
    
    func setRTChangeSelectionAction(block: (Void)->(Void)) {
        self.changeSelectionAction = block
    }
    
    func setRTSelectButton(block: (Void) -> (Void)){
        self.selectableDisplay?.selectableAction = ({self.buttonSelectAction()})
        self.selectButtonAction = block
    }
    
    
    func refreshLabelName(){
        self.labelObjectName!.labelText!.setLabelText(GHeroesManager!.currentHero.nameShown)
        self.labelObjectName?.labelText!.introAnimation()
    }
    
    private func initSelectionMenu(){
        
        // [0] Left, [1] Right, [2] Select, [3] ObjectName
        
        self.selectableDisplay = RTSelectable(imageNamed: objectArray[0].imageName)
        self.addChild(self.selectableDisplay!)
        
        self.btnLeft = RTBoingButton(imageNamed: self.buttonsImageNames[0], actionOnTouchBegan: true, actionTime: 0.2)
        self.btnLeft?.setRTButtonAction({ () -> () in
            self.buttonLeftAction()
        })
        self.btnLeft?.idleAnimation(10.0, moveY: 0.0, waitTime: 0.8, reverse: false)
        self.btnLeft?.zPosition += 1
        self.addChild(self.btnLeft!)
        
        self.btnRight = RTBoingButton(imageNamed: self.buttonsImageNames[1], actionOnTouchBegan: true, actionTime: 0.2)
        self.btnRight?.setRTButtonAction({ () -> () in
            self.buttonRightAction()
        })
        self.btnRight?.idleAnimation(10.0, moveY: 0.0, waitTime: 0.8, reverse: true)
        self.btnRight?.zPosition += 1
        self.addChild(self.btnRight!)
        
        self.btnSelect = RTTextButton(imageNamed: self.buttonsImageNames[2], actionOnTouchBegan: false, text: selectButtonTexts[1], fontSize: fontSize, minimum: 5, colors: colors, actionTime: 1.0)
        self.btnSelect?.setRTButtonAction({ () -> () in
            self.buttonSelectAction()
        })
        self.btnSelect?.blinkAnimation()
        self.addChild(self.btnSelect!)
        
        
        self.labelObjectName = RTTextButton(imageNamed: self.buttonsImageNames[3], actionOnTouchBegan: false, text: "NAME", fontSize: fontSize, minimum: 7, colors: colors, actionTime: 1.0)
        self.labelObjectName!.userInteractionEnabled = false
        self.refreshLabelName()
        self.addChild(self.labelObjectName!)
        

    }
    
    private func buttonSelectAction(){
        if checkLocked(){
            // POP UP COMPRAR / SOM DE DENIED
        }
        else{
            // SELECIONA OBJETO
            self.selectButtonAction()
            
        }
        
    }
    
    private func buttonRightAction(){
        self.chanceSelection(1)
        GAudioManager!.playSound(RTAudioManager.SoundsEnum.Blop)
    }
    
    private func buttonLeftAction(){
        self.chanceSelection(-1)
        GAudioManager!.playSound(RTAudioManager.SoundsEnum.Blop)
    }

    private func chanceSelection(value: Int){
        
        var direction: Bool
        
        if value <= 1{
            self.selectionIndex += value
            if value == 1{
                direction = true
            }
            else{
                direction = false
            }
        }
        else{
            self.selectionIndex = value
            direction = true
        }
        
        
        if selectionIndex > objectArray.count-1{
            selectionIndex = 0
        }
        
        if selectionIndex < 0{
            selectionIndex = objectArray.count-1
        }
        
        self.changeSelectionAnimation(left: direction)
        self.changeSelectionAction()
        self.refreshLabelName()
        
    }
    
    // Animação de troca entre Objetos
    private func changeSelectionAnimation(#left: Bool){
        
        self.changeSelectButton()
        
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
        
        let changeTexture = SKAction.runBlock({
            self.changeSelectableDisplayTexture()
            self.changeSelectButton()
        })
        
        let sequence = SKAction.sequence([move, blink, move])
        let sequenceFade = SKAction.sequence([fadeOut, changeTexture, fadeIn])
        
        self.selectableDisplay!.runAction(sequenceFade)
        self.selectableDisplay!.runAction(sequence)
        
    }
    
    // Muda a texture do Objeto Selecionado
    private func changeSelectableDisplayTexture(){
        
        var locked: SKAction
        
        if checkLocked(){
            locked = SKAction.colorizeWithColor(SKColor.blackColor(), colorBlendFactor: 1.0, duration: 0.0)
        }
        else{
            locked = SKAction.colorizeWithColor(SKColor.clearColor(), colorBlendFactor: 0.0, duration: 0.0)
        }
        
        selectableDisplay!.runAction(locked)
        selectableDisplay?.texture = self.objectArray[self.selectionIndex].texture!
    }
    
    
    // Muda o botão de seleção
    private func changeSelectButton(){
        
        var select: String
        
        if checkLocked(){
            select = self.selectButtonTexts[0]
        }
        else{
            select = self.selectButtonTexts[1]
        }
        
        self.btnSelect!.labelText?.setLabelText(select)
        self.btnSelect!.labelText?.introAnimation()
    }
    
    private func checkLocked() -> Bool{
        return self.objectArray[self.selectionIndex].locked
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
