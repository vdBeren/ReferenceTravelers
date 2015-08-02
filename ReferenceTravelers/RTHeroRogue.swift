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
        super.init(imageNamed: "SNEAKYROGUE")
        
        self.locked = true
        
        self.nameShown = "SNEAKY ROGUE"
        self.quote = "Look over there! Puff, your wallet is gone."
        
        self.attributes.primaryType = RTAttributes.PrimariesEnum.Dexterity
        self.attributes.primary = 3
        self.attributes.agility = 5
        self.attributes.luck = 2
        self.attributes.greed = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
