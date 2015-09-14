//
//  RTPauseWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 7/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Botão que pausa e mostra Pop-Up que tem Voltar, Continuar ou Recomeçar

class RTPauseWindow: RTWindow {
   
    var buttonPlay, buttonBack: RTTextButton?
    var labelText: RTLabelText?
    var windowConfirm: RTConfirmWindow?
    
    init(){
        
        super.init(imageNamed: "windowPopUp", background: true)
        
        self.name = "PAUSEWINDOW"
       // self.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        
        self.userInteractionEnabled = false
        
        self.position = CGPoint(x: GSize.width/2, y: GSize.height/2)
        self.initContents()
        
        self.introAnimation()
        //self.floatingAnimation()
        
        
    }
    
    func initContents(){
        
        labelText = RTLabelText(text: "TRAVEL BACK?", fontSize: 60, minimum: 5)
        //self.labelText?.position = CGPoint(x: self.windowPopUp!.size.width, y: self.windowPopUp!.size.height)
        self.labelText?.position.y += self.size.height/20
        self.addChild(labelText!)
        self.labelText?.introAnimation()
        
        let colors = [SKColor.whiteColor(), SKColor.whiteColor()]
        
        self.buttonBack = RTTextButton(imageNamed: "btnPopUp", actionOnTouchBegan: false, text: "MAIN MENU", fontSize: 32, minimum: 4, colors: colors, actionTime: 1.0)
        self.buttonBack!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.buttonBack!.position.x -= self.size.width/7
        self.buttonBack!.position.y -= self.size.height/10
        
        self.buttonBack!.setRTButtonAction { () -> () in
            self.callWindowConfirm()
        }
        
        self.addChild(self.buttonBack!)
        
        self.buttonPlay = RTTextButton(imageNamed: "btnPopUp", actionOnTouchBegan: false, text: "CONTINUE", fontSize: 32, minimum: 4, colors: colors, actionTime: 1.0)
        self.buttonPlay!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.buttonPlay!.position.x += self.size.width/7
        self.buttonPlay!.position.y -= self.size.height/10
        
        self.buttonPlay!.setRTButtonAction { () -> () in
            GGamePaused = false
            self.closeWindow()
        }
        
        self.addChild(self.buttonPlay!)
        
        
        
    }
    
    func callWindowConfirm(){
        self.windowConfirm = RTConfirmWindow()
        self.windowConfirm?.setWindowBackButton({ () -> () in
            
            GAudioManager?.playMusic(RTAudioManager.MusicsEnum.Title)
            GHeroSelectionScene!.returningFromStage()
            GHeroesManager?.currentHero.attributes.restoreAttributes()
            
            let transition = SKTransition.crossFadeWithDuration(1.2)
            self.scene?.view?.presentScene(GHeroSelectionScene!, transition: transition)
            
        })
        self.addChild(windowConfirm!)
        self.windowConfirm?.introAnimation()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
