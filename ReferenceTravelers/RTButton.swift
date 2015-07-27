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
        self.zPosition = 0
        self.userInteractionEnabled = true
        
        
    }
    
    //Função que troca a imagem do botão para sua imagem de tocado.
    func setButtonPressed(){
        if buttonPressed{
            self.texture = SKTexture(imageNamed: buttonImageName)
        }
        else{
            self.texture = SKTexture(imageNamed: buttonImageName + "-t")
        }
        
        buttonPressed = !buttonPressed
    }
    
    func setRTButtonAction(block: (Void)->(Void)) {
        self.buttonAction = block
    }
    
    //Recebe toques no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        setButtonPressed()
        
        if actionOnTouchBegan{
            GAudioNode!.playSound(RTAudio.SoundsEnum.Dano)
            self.buttonAction()
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        setButtonPressed()
        
        if !actionOnTouchBegan{
            GAudioNode!.playSound(RTAudio.SoundsEnum.Dano)
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
