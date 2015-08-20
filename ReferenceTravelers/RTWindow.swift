//
//  RTWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


// Classe de janela popup generica.

class RTWindow: RTHideRequired {
    
    
    var blackBackground: RTBackground?
    var windowPopUp: SKSpriteNode?
    
    
    init(imageNamed imageName: String, background: Bool){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: "NOTHING")
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        windowPopUp = SKSpriteNode(imageNamed: imageName)
        self.windowPopUp?.userInteractionEnabled = false
        
        self.windowPopUp?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(windowPopUp!)
        
        if background{
            blackBackground = RTBackground(imageNamed: "bgBlack")
            self.blackBackground?.alpha = 0.5
            self.blackBackground?.zPosition -= 1
            self.blackBackground?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            self.addChild(self.blackBackground!)
        }
 
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }
    
    func floatingAnimation(){
        
        // EFEITO DE ANIMAÇÃO AO FICAR NA TELA :)
        
        var waitTime: NSTimeInterval = 2.5
        var move: CGFloat = 5.0
        
        let moveUp = SKAction.moveByX(0.0, y: move, duration: waitTime)
        let moveDown = SKAction.moveByX(0.0, y: -move, duration: waitTime)
        let wait = SKAction.waitForDuration(0.01)
        let sequence = SKAction.sequence([moveUp, wait, moveDown])
        
        self.runAction(SKAction.repeatActionForever(sequence))
    }
    
    
    func closeWindow(){
        // EFEITO DE ANIMAÇÃO AO DESAPARECER :O
        
        var scale: CGFloat = 1.3
        var duration: NSTimeInterval = 0.1
        let scaleActionBegin = SKAction.scaleTo(scale, duration: duration)
        
        scale = 0.1
        duration = 0.2
        let scaleActionFinish = SKAction.scaleTo(scale, duration: duration)
        
        let block = SKAction.runBlock ({self.removeFromParent()})
        
        let sequenceArray = SKAction.sequence([scaleActionBegin, scaleActionFinish, block])
        self.runAction(sequenceArray)
        
        
    }
    
    
}
