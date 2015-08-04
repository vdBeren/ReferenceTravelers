//
//  RTTitleStart.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 3/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe que controla o monitor da tela de titulo.

class RTTitleStart: RTHideRequired {
   
    var labelStart, labelStart2: RTLabelText?

    
    init(){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: "screenBright")
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        labelStart = RTLabelText(text: "FINGERPRINT", fontSize: 30.0, minimum: 6)
        labelStart?.position.y += 20
        self.addChild(labelStart!)
        
        labelStart2 = RTLabelText(text: "SCAN", fontSize: 30.0, minimum: 6)
        labelStart2?.position.y -= 20
        self.addChild(labelStart2!)
        
        self.initAnimation()
    }

    
    func initAnimation(){
        
        let alpha = SKAction.fadeAlphaTo(0.6, duration: 0.4)
        let alphaBack = SKAction.fadeAlphaTo(1.0, duration: 0.4)
        let sequence = SKAction.sequence([alpha, alphaBack])
        
        self.runAction(SKAction.repeatActionForever(sequence))
        
        labelStart?.introAnimation()
        labelStart2?.introAnimation()
    }
    
    func acceptedAnimation(){
        labelStart?.setLabelText("SCAN COMPLETE")
        labelStart2?.setLabelText("ACCESS GRANTED")
        
        labelStart?.fontSize -= 6
        labelStart2?.fontSize -= 6
        
        labelStart?.introAnimation()
        labelStart2?.introAnimation()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
