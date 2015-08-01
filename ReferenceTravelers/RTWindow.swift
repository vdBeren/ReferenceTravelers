//
//  RTWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


//Classe com os efeitos usados nas Janelas popup do jogo!

class RTWindow: RTHideRequired {

    func introAnimation(){
        
        // EFEITO DE ANIMAÇÃO AO APARECER :D
        
        var scale: CGFloat = 0.1
        var duration: NSTimeInterval = 0.0
        let scaleActionBegin = SKAction.scaleTo(scale, duration: duration)
        
        scale = 1.0
        duration = 0.2
        let scaleActionFinish = SKAction.scaleTo(scale, duration: duration)
        
        let wait = SKAction.waitForDuration(0.5)
        
        let sequenceArray = SKAction.sequence([scaleActionBegin, scaleActionFinish])
        self.runAction(sequenceArray)
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
