//
//  RTHeroMage.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 1/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


// Mago! Atira bolas de fogo de seu cajado.
class RTHeroMage: RTHero {
    
    init(){
        super.init(imageNamed: "heroGeneric")
        
        self.locked = true
        
        self.nameShown = "MAD MAGE"
        self.quote = "BLAARGH WAARHGH BLARRGH! @_@"
        
        self.attributes.primaryType = RTAttributes.PrimariesEnum.Intelligence
        self.attributes.primary = 7
        self.attributes.agility = 3
        self.attributes.luck = 5
        self.attributes.greed = 1
        
        self.attributes.health = 80
        self.attributes.stamina = 90
        self.attributes.maxHealth = 80
        self.attributes.maxStamina = 90
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
