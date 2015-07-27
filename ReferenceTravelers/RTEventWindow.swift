//
//  RTEventWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTEventWindow: RTHideRequired {
    
    var buttonClose: RTButton?
    var labelEvent: RTLabel?
    
    init(imageNamed imageName: String, description: String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "EVENTWINDOW"
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.zPosition = 5
        self.userInteractionEnabled = true
        
        self.buttonClose = RTButton(imageNamed: "btnEventWindow", actionOnTouchBegan: false)
        self.buttonClose!.anchorPoint = CGPoint(x: 0.5, y: 2.0)
        
        // BLOCO DE AÇÃO DO BOTAO DA EVENT WINDOW
        self.buttonClose?.setRTButtonAction({ () -> () in
            self.closeEventWindow()
        })
        
        self.addChild(self.buttonClose!)
        
        self.setContents(imageName, description: description)
        
        
        self.introAnimation()
        self.floatingAnimation()
        
        
    }
    
    func setContents(name: String, description: String){
        self.labelEvent = RTLabel(text: description)
        // self.labelEvent!.position = CGPoint(x: 320.0, y: 140.0)
        self.addChild(labelEvent!)
    }
    
    func introAnimation(){
        
        // EFEITO DE ANIMAÇÃO AO APARECER :D
        
        var scale: CGFloat = 0.1
        var duration: NSTimeInterval = 0.0
        let scaleActionBegin = SKAction.scaleTo(scale, duration: duration)
        
        scale = 1.0
        duration = 0.2
        let scaleActionFinish = SKAction.scaleTo(scale, duration: duration)
        
        let sequenceArray = SKAction.sequence([scaleActionBegin, scaleActionFinish])
        self.runAction(sequenceArray)
        self.labelEvent!.introAnimation()
    }
    
    func floatingAnimation(){
        
        // EFEITO DE ANIMAÇÃO AO FICAR NA TELA :)
        
        var waitTime: NSTimeInterval = 1.2
        var move: CGFloat = 10.0
        
        let moveUp = SKAction.moveByX(-move/2, y: move, duration: waitTime)
        let moveDown = SKAction.moveByX(move/2, y: -move, duration: waitTime)
        let wait = SKAction.waitForDuration(0.01)
        let sequence = SKAction.sequence([moveUp, wait, moveDown])
        
        self.runAction(SKAction.repeatActionForever(sequence))
    }
    
    
    func closeEventWindow(){
        self.removeFromParent()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.introAnimation()
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.buttonClose!.buttonAction()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
