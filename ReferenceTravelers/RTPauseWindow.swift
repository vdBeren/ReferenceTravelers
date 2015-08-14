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
   
    var background: RTBackground?
    var buttonPlay, buttonBack: RTBoingButton?
    
    init(){
        
        super.init(imageNamed: "", background: true)
        
        self.name = "PAUSEWINDOW"
        //self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //self.position = CGPoint(x: super.size.width/2, y: super.size.height/2)
        //println("\(super.size.width), \(super.size.height)")
        
        self.userInteractionEnabled = false
        
        
        self.initContents()
        
        self.introAnimation()
        //self.floatingAnimation()
        
        
    }
    
    func initContents(){
        
        self.buttonBack = RTBoingButton(imageNamed: "", actionOnTouchBegan: false, actionTime: 1.0)
        self.buttonBack!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.buttonBack!.position = CGPoint(x: GSize.width/2.5, y: GSize.height/2)
        self.addChild(self.buttonBack!)
        
        self.buttonPlay = RTBoingButton(imageNamed: "", actionOnTouchBegan: false, actionTime: 1.0)
        self.buttonPlay!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.buttonPlay!.position = CGPoint(x: GSize.width/1.6, y: GSize.height/2)
        self.addChild(self.buttonPlay!)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
