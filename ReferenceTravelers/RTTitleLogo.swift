//
//  RTTitleLogo.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 3/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTTitleLogo: RTHideRequired {
    
    init(){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: "RTLogo")
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.initAnimation()
        
    }
    
    func initAnimation(){
        let waitTime: NSTimeInterval = 1.8
        
        let moveUp = SKAction.moveByX(0.0, y: 8.0, duration: waitTime)
        let moveDown = SKAction.moveByX(0.0, y: -8.0, duration: waitTime)
        let sequenceMove = SKAction.sequence([moveUp, moveDown])
        
        let forever = SKAction.repeatActionForever(sequenceMove)
        
        self.runAction(forever)
    }
    
    func outroAnimation(){
        let moveUp = SKAction.moveByX(0.0, y: 600, duration: 0.8)
        let alpha = SKAction.fadeAlphaTo(0.0, duration: 0.8)
        
        let group = SKAction.group([moveUp, alpha])
        
        self.runAction(group)
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
