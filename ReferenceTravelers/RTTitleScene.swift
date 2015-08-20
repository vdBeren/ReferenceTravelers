//
//  RTTitleScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe da cena da tela de Titulo

class RTTitleScene: SKScene {

    var backgroundNode: RTBackground?
    var logo: RTTitleLogo?
    var screen: RTTitleStart?
    
    var outroStarted: Bool = false
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        self.backgroundColor = UIColor.blackColor()
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bgTitle")
        //backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        backgroundNode!.alpha = 0.2
        self.addChild(backgroundNode!)
        
        screen = RTTitleStart()
        screen!.position = CGPoint(x: self.size.width/2.05, y: self.size.height/3.85)
        self.addChild(screen!)
        
        logo = RTTitleLogo()
        logo!.position = CGPoint(x: self.size.width/2, y: self.size.height/1.6)
        self.addChild(logo!)
    
        
        self.userInteractionEnabled = true
        
    }
    
    func outroAnimation(){
        
        // ANIMAÇÃO DE ACESSO E LUZES
        
        self.screen!.acceptedAnimation()
        
        let blockLogo = SKAction.runBlock({
            self.logo!.outroAnimation()
            
        })
        
        let waitLogo = SKAction.waitForDuration(0.8)
        let waitOutros = SKAction.waitForDuration(1.4)
        
        let soundSwitch = SKAction.runBlock({
            GAudioManager!.playSound(RTAudioManager.SoundsEnum.Switch)
        })
        
        let soundGenerator = SKAction.runBlock({
            GAudioManager!.playSound(RTAudioManager.SoundsEnum.Power)
        })
        
        let alpha = SKAction.fadeAlphaTo(1.0, duration: 0.1)
        let alphaBack = SKAction.fadeAlphaTo(0.2, duration: 0.3)
        let wait = SKAction.waitForDuration(0.3)
        
        let sequence = SKAction.sequence([waitOutros, blockLogo, waitLogo, soundSwitch, wait, soundGenerator, wait, wait, alpha, alphaBack, wait, alpha, alphaBack, waitLogo, alpha, wait])
        
        let zoom = SKAction.scaleTo(1.15, duration: 1.0)
        let move = SKAction.moveByX(-70, y: -70, duration: 1.0)
        
        
        let blockScreen = SKAction.runBlock({
            self.screen!.removeAllActions()
            let alphaScreen = SKAction.fadeAlphaTo(0.0, duration: 0.2)
            self.screen!.runAction(alphaScreen)
            GAudioManager!.playMusic(RTAudioManager.MusicsEnum.Title)
            
        })
        
        let group = SKAction.group([blockScreen, zoom, move])
        
        let blockHero = SKAction.runBlock({
            let transition = SKTransition.crossFadeWithDuration(0.8)
            self.scene?.view?.presentScene(GHeroSelectionScene, transition: transition)
        })
        
        let sequenceHero = SKAction.sequence([group, blockHero])
        
        let sequenceFinal = SKAction.sequence([sequence, waitLogo, sequenceHero])
        
        self.backgroundNode!.runAction(sequenceFinal)
        
    }
    
    //Chamado a todo frame. Usado para realizar o update dos nodes da Scene, em cascata.
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
    }
    
    
    //Recebe toques na Scene.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
       
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if !self.outroStarted{
            self.outroAnimation()
        }
        
        self.outroStarted = true
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
