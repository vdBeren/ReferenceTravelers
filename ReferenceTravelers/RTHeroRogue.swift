//
//  RTHeroRogue.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 1/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


// Gatuno! Arremessa facas.
class RTHeroRogue: RTHero {
    
    init(){
        super.init(imageNamed: "heroGeneric")
        
        self.locked = true
        
        self.nameShown = "SNEAKY ROGUE"
        self.quote = "Look over there! (Your wallet is gone)"
        
        self.attributes.primaryType = RTAttributes.PrimariesEnum.Dexterity
        self.attributes.primary = 3
        self.attributes.agility = 5
        self.attributes.luck = 2
        self.attributes.greed = 4
        
        self.attributes.health = 80
        self.attributes.stamina = 140
        self.attributes.maxHealth = 80
        self.attributes.maxStamina = 140
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
