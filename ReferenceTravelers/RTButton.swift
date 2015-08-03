//
//  RTButton.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 16/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


// Classe de um botão comum, que está pressionado ou não. Troca de imagem ao ser pressionado, e troca de volta ao ser solto.
// Pode ativar sua ação ao ser tocado ou quando for solto.
// Sua ação é definida por bloco, por quem instanciou, atraves do metodo ' setRTButtonAction '.
// Necessário que um botão seja iniciado com o nome de sua imagem, e que a imagem pressionado tenha o mesmo nome junto do sufixo ' -t '

class RTButton: RTHideRequired {
    
    var buttonAction: (Void) -> (Void) = {}
    var buttonPressed: Bool = false
    var actionOnTouchBegan: Bool //Se a ação do botão é realizada ao soltar ou ao tocar o botão
    var buttonImageName: String
    
    
    init (imageNamed imageName:String, actionOnTouchBegan: Bool){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        self.buttonImageName = imageName
        self.actionOnTouchBegan = actionOnTouchBegan
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "BUTTON"
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.userInteractionEnabled = true
        
        
    }
    
    //Função que troca a imagem do botão para sua imagem de tocado.
    func setButtonPressed(){
        if buttonPressed{
            self.texture = SKTexture(imageNamed: buttonImageName)
            self.shrinkAnimation()
        }
        else{
            self.texture = SKTexture(imageNamed: buttonImageName + "-t")
            self.stretchAnimation()
        }
        
        buttonPressed = !buttonPressed
    }
    
    // RT porque entra em conflito com um negocio do Swift
    func setRTButtonAction(block: (Void)->(Void)) {
        self.buttonAction = block
    }
    
    func stretchAnimation(){
        let shrink = SKAction.scaleTo(0.8, duration: 0.1)
        let stretch = SKAction.scaleTo(1.2, duration: 0.2)
        let sequence = SKAction.sequence([shrink, stretch])
        
        self.runAction(sequence)
    }
    
    func shrinkAnimation(){
        let stretch = SKAction.scaleTo(1.2, duration: 0.1)
        let shrink = SKAction.scaleTo(1.0, duration: 0.2)
        let sequence = SKAction.sequence([stretch, shrink])
        
        self.runAction(sequence)
    }
    
    func idleAnimation(moveX: CGFloat, moveY: CGFloat, waitTime: NSTimeInterval, reverse: Bool){
        
        var revert: CGFloat = 1
        var x, y: CGFloat
        
        if reverse{
            revert = -1
        }
        
        x = moveX * revert
        y = moveY * revert
        
        let moveUp: SKAction
        let moveDown: SKAction
        
        moveUp = SKAction.moveByX(x, y: y, duration: waitTime)
        moveDown = SKAction.moveByX(-x, y: -y, duration: waitTime)

        let sequence = SKAction.sequence([moveUp, moveDown])
        self.runAction(SKAction.repeatActionForever(sequence))
    }
    
    
    //Recebe toques no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        setButtonPressed()
        
        if actionOnTouchBegan{
            //GAudioNode!.playSound(RTAudio.SoundsEnum.Dano)
            self.buttonAction()
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        setButtonPressed()
        
        if !actionOnTouchBegan{
            //GAudioNode!.playSound(RTAudio.SoundsEnum.Dano)
            self.buttonAction()
        }
        
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        self.touchesEnded(touches, withEvent: event)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
