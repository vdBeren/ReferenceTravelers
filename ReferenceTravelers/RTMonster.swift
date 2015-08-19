//
//  RTMonster.swift
//  ReferenceTravelers
//
//  Created by Bruno de Paula Munhoz on 11/08/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTMonster: RTHideRequired {
    var vida : Int = 1
    //var lado : Int = 0
    var cont : Int = 0
    
    init(imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "MONSTER"
        self.userInteractionEnabled = false
    }
    
    func monsterMove(){
        let wait = SKAction.waitForDuration(0.5)
        let block = SKAction.runBlock({
            if(arc4random_uniform(2) == 0){
                if(arc4random_uniform(2) == 1){
                    self.physicsBody?.applyImpulse(CGVector(dx: 75, dy: 0))
                    self.xScale = -1
                } else {
                    self.physicsBody?.applyImpulse(CGVector(dx: -75, dy: 0))
                    self.xScale = 1
                }
            }
        })
        runAction(SKAction.repeatActionForever(SKAction.sequence([wait, block])))
    }
    
    func monsterDie(){
        //Do something
        self.removeFromParent()
    }
    
    func update(){
        fatalError("MUST OVERRIDE THIS METHOD!")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

