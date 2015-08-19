//
//  RTSelectable.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe de um objeto que pode ser selecionado.

class RTSelectable: RTHideRequired {
    
    var locked: Bool = true
    var imageName: String = ""
    var moneyCost: CGFloat = 0.99
    
    var selectableAction: () -> () = {}
    var selectableActionRunning = false
    var waitTimeInterval: NSTimeInterval = 1.5
    
    
    init(imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.userInteractionEnabled = true
        
        self.name = "SELECTABLE"
        
    }
    
    func setRTSelectableAction(block: ()->()){
        self.selectableAction = block
    }
    
    func touchOcurred(){
        if !selectableActionRunning{
            self.selectableAction()
        }
        
        self.selectableActionRunning = true
        
        let actionWaitBlock = SKAction.runBlock({
            self.selectableActionRunning = false
        })
        
        let wait = SKAction.waitForDuration(self.waitTimeInterval)
        let sequence = SKAction.sequence([wait, actionWaitBlock])
        
        self.runAction(sequence)
    }
        
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.touchOcurred()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
