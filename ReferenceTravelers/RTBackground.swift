//
//  RTBackground.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 15/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

//Classe responsavel pela imagem de fundo do jogo.

class RTBackground: RTHideRequired {
    
    init (imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)

        self.name = "BACKGROUND"
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //self.zPosition = -3
        
        self.userInteractionEnabled = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
