//
//  RTStage.swift
//  ReferenceTravelers
//
//  Created by Bruno de Paula Munhoz on 31/07/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import Foundation

import UIKit
import SpriteKit

class RTStage: RTHideRequired {
    
    var information: String = ""
    var difficulty : String = ""
    
    init(imageNamed imageName:String){
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
    }
    
    //Recebe toques na tela no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}