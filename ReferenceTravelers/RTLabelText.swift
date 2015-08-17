//
//  RTLabelText.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTLabelText: RTLabel {
   
    
    init(text: String, fontSize: CGFloat, minimum: Int){
        
        super.init(fontSize: fontSize)
        
        self.minimum = minimum
        self.finalText = text
        
    }
    
    func moveLabelTo(location: CGPoint){
        let move = SKAction.moveTo(location, duration: 0.7)
        let wait = SKAction.waitForDuration(0.3)
        
        let block = SKAction.runBlock({self.introAnimation()})
        
        let fade = SKAction.fadeAlphaTo(0.0, duration: 0.3)
        
        let sequence = SKAction.sequence([move, wait, block, wait, fade])
        
        self.runAction(sequence)
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
