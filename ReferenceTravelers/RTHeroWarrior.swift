//
//  RTHeroWarrior.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 1/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


// Guerreiro! Usa uma espada.
class RTHeroWarrior: RTHero {
    
    init(){
        super.init(imageNamed: "heroBraveWarrior")
        
        self.locked = false
        
        self.nameShown = "BRAVE WARRIOR"
        self.quote = "Yeah, you know, i'm kinda brave."
        
        self.attributes.primaryType = RTAttributes.PrimariesEnum.Strength
        self.attributes.primary = 5
        self.attributes.agility = 4
        self.attributes.luck = 3
        self.attributes.greed = 2
        
        self.attributes.health = 150
        self.attributes.stamina = 80
        self.attributes.maxHealth = 150
        self.attributes.maxStamina = 80
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
