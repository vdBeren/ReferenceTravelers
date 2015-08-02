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
    
    var selected: Bool = false
    var locked: Bool = true
    var imageName: String = ""
    var moneyCost: Float = 0.99
    
    
    init(imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "SELECTABLE"
        self.userInteractionEnabled = false
        
    }
    
    func isSelected() -> Bool{
        return selected
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
