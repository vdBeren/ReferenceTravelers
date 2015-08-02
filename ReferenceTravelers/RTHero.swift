//
//  RTHero.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTHero: RTSelectable {

    var attributes: RTAttributes = RTAttributes()
    var quote: String = ""
    var nameShown = ""
    
    override init(imageNamed imageName:String){
        
        super.init(imageNamed: imageName)
        
        self.imageName = imageName
        
        self.name = "HERO"
        self.userInteractionEnabled = false
        
        //Cria o corpo fisico do HEROI
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        self.physicsBody?.dynamic = true
        
        self.physicsBody?.mass = 0.01
        
        self.physicsBody!.collisionBitMask = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
