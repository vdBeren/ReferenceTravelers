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
// Ao jogador é dado, seguindo um limite, a opção de pular esse evento usando Gold ou vendo um Video.
// Uma janela tem sua imagem chamada a partir do tipo de evento. O arquivo da imagem tem que ter a formatação: "TipoDoEvento-eWindowBG"
// Ex: TREASURE-eWindowBG


class RTEventWindow: RTWindow {
    
    var buttonClose: RTButton?
    var labelEventDescription, labelEventName, labelEventValue: RTLabel?
    var event: RTEvent?
    var value: Int = 0
    var clickClose: Bool = false
    
    init(event: RTEvent, value: Int){
        
        let color = UIColor.clearColor()
        //let texture = SKTexture(imageNamed: imageName.rawValue + "-eWindowBG")
        let texture = SKTexture(imageNamed: "windowEvent")
        let size = texture.size()
        
        super.init(imageNamed: "windowEvent", background: true)
        
        self.name = "EVENTWINDOW"
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.zPosition = 5
        self.userInteractionEnabled = true
        
        self.event = event
        self.value = value
        
        self.buttonClose = RTButton(imageNamed: "btnEventWindow", actionOnTouchBegan: false, actionTime: 1.0)
        self.buttonClose!.anchorPoint = CGPoint(x: 0.5, y: 2.0)
        
        // BLOCO DE AÇÃO DO BOTAO DA EVENT WINDOW
        // Aqui transforma o tile atual do tabuleiro em usado e chama o update de tabuleiro.
        self.buttonClose?.setRTButtonAction({ () -> () in
            if !self.clickClose{
                self.clickClose = true
                GBoardScene!.setCurrentTileUsed()
                self.closeWindow()
            }

        })
        
        //self.addChild(self.buttonClose!)
        
        self.setContents()
        
        self.introAnimation()
       // self.floatingAnimation()
        
        
    }
    
    func setContents(){
        
        // TODO: Colocar efeito de idle animation.
        
        // Textos da tela de Evento
        self.labelEventDescription = RTLabelText(text: self.event!.eventDescription, fontSize: 24, minimum: 8)
        self.labelEventDescription!.position.y -= self.size.height/10
        self.addChild(labelEventDescription!)
        
        self.labelEventName = RTLabelText(text: self.event!.name, fontSize: 46, minimum: 6)
        self.labelEventName!.fontSize += 10
        self.labelEventName!.position.y += self.size.height/10
        self.addChild(labelEventName!)
        
        // Se valor recebido for menor que 0, não mostra o valor do evento.
        self.labelEventValue = RTLabelText(text: String(value), fontSize: 36, minimum: 3)
        
        if self.value > 0{
            self.labelEventValue!.fontSize += 16
            self.labelEventValue!.fontColor = SKColor.orangeColor()
            //self.labelEventValue!.position.y += self.size.height/10
            self.addChild(labelEventValue!)
        }
        
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
        //self.introAnimation()
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.buttonClose!.buttonAction()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
