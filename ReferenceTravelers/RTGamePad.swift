//
//  RTGamePad.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 16/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


//Classe do gamepad usado no modo combate. Possui dois SelectorButton (Movimento) e um Button (Ação / Pulo)

class RTGamePad: RTHideRequired {
    
    var btnLeft, btnRight: RTSelectorButton?
    var btnAction: RTButton?
    
    init (){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: "GamePad")
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "GAMEPAD"
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.position = CGPoint(x: 0.0, y: 0.0)
        self.zPosition = 0
        self.userInteractionEnabled = true
        
        btnLeft = RTSelectorButton(imageNamed: "btnLeft")
        btnLeft!.position = CGPoint(x: 100.0, y: 100.0)
        self.addChild(btnLeft!)
        
        btnRight = RTSelectorButton(imageNamed: "btnRight")
        btnRight!.position = CGPoint(x: btnRight!.size.width + 150.0, y: 100.0)
        self.addChild(btnRight!)
        
        btnRight!.setButtonSelected()
        
        btnAction = RTButton(imageNamed: "btnAction")
        btnAction!.position = CGPoint(x: self.size.width - btnAction!.size.width - 100, y: 100.0)
        
        //BLOCO DE AÇÃO DO BOTÃO
        btnAction?.setRTButtonAction({ () -> () in
            
        })

        self.addChild(btnAction!)
    }
    
    func selectorControl(){
        if btnLeft!.isSelected() || btnRight!.isSelected(){
            btnRight!.setButtonSelected()
            btnLeft!.setButtonSelected()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
