//
//  RTEventWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


// Classe da janela de evento. É chamada para realizar notificar o jogador do evento.
// Ao jogador é dado, seguindo um limite, a opção de pular esse evento usando Gold ou Vendo um Video.
// Uma janela tem sua imagem chamada a partir do tipo de evento. O arquivo da imagem tem que ter a formatação: "TipoDoEvento-eWindowBG"
// Ex: TREASURE-eWindowBG


class RTEventWindow: RTHideRequired {
    
    var buttonClose: RTButton?
    var labelEvent: RTLabel?
    
    init(imageNamed imageName: RTEvent.EventType, event: RTEvent, value: Int){
        
        let color = UIColor.clearColor()
        //let texture = SKTexture(imageNamed: imageName.rawValue + "-eWindowBG")
        let texture = SKTexture(imageNamed: "EventWindow")
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
        
        self.setContents(imageName, description: event.eventDescription)
        
        
        self.introAnimation()
        self.floatingAnimation()
        
        
    }
    
    func setContents(name: RTEvent.EventType, description: String){
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
