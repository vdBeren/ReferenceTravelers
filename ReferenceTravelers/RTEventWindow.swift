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


class RTEventWindow: RTWindow {
    
    var buttonClose: RTButton?
    var labelEventDescription, labelEventName, labelEventValue: RTLabel?
    var event: RTEvent?
    var value: Int = 0
    
    init(event: RTEvent, value: Int){
        
        let color = UIColor.clearColor()
        //let texture = SKTexture(imageNamed: imageName.rawValue + "-eWindowBG")
        let texture = SKTexture(imageNamed: "EventWindow")
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "EVENTWINDOW"
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.zPosition = 5
        self.userInteractionEnabled = true
        
        self.event = event
        self.value = value
        
        
        self.buttonClose = RTButton(imageNamed: "btnEventWindow", actionOnTouchBegan: false)
        self.buttonClose!.anchorPoint = CGPoint(x: 0.5, y: 2.0)
        
        // BLOCO DE AÇÃO DO BOTAO DA EVENT WINDOW
        self.buttonClose?.setRTButtonAction({ () -> () in
            self.closeWindow()
        })
        
        self.addChild(self.buttonClose!)
        
        self.setContents()
        
        self.introAnimation()
        self.floatingAnimation()
        
        
    }
    
    func setContents(){
        self.labelEventDescription = RTLabel(text: self.event!.eventDescription)
        //self.labelEventDescription!.position = CGPoint(x: self.size.width*2, y: self.size.height*2)
        self.addChild(labelEventDescription!)
        
        self.labelEventName = RTLabel(text: self.event!.name)
        self.labelEventName!.fontSize += 10
        self.labelEventName!.position.y += self.size.height/4
        self.addChild(labelEventName!)
        
        self.labelEventValue = RTLabel(text: String(value))
        self.labelEventValue!.fontSize += 16
        self.labelEventValue!.position.y += self.size.height/6
        self.addChild(labelEventValue!)
    }
    
     override func introAnimation(){
        
        // EFEITO DE ANIMAÇÃO AO APARECER :D
    
        var scale: CGFloat = 0.1
        var duration: NSTimeInterval = 0.0
        let scaleActionBegin = SKAction.scaleTo(scale, duration: duration)
        
        scale = 1.0
        duration = 0.2
        let scaleActionFinish = SKAction.scaleTo(scale, duration: duration)
        
        let labelName = SKAction.runBlock({self.labelEventName!.introAnimation()})
        let labelValue = SKAction.runBlock({self.labelEventValue!.introAnimation()})
        let labelDesc = SKAction.runBlock({self.labelEventDescription!.introAnimation()})
        let wait = SKAction.waitForDuration(0.5)
        
        let sequenceLabels = SKAction.sequence([labelName, wait, labelValue, wait, labelDesc])
        
        let sequenceArray = SKAction.sequence([scaleActionBegin, scaleActionFinish, sequenceLabels])
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
