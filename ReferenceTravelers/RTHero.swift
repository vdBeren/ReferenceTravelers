//
//  RTHero.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTHero: RTHideRequired {

    var properties: RTAttributes = RTAttributes()
    var information: String = ""
    
    init(imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "CHARACTER"
        self.userInteractionEnabled = false
        
        //Cria o corpo fisico do HEROI
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        self.physicsBody?.dynamic = true
        
        self.physicsBody?.mass = 0.01
        
        self.physicsBody!.collisionBitMask = 0
    }
    
    
    //Recebe toques na tela no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
