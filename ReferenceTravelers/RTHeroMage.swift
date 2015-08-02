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
        super.init(imageNamed: "MADMAGE")
        
        self.locked = true
        
        self.nameShown = "MAD MAGE"
        self.quote = "BLAARGH WAAAARHGH BLARRGHH!!"
        
        self.attributes.primaryType = RTAttributes.PrimariesEnum.Intelligence
        self.attributes.primary = 6
        self.attributes.agility = 3
        self.attributes.luck = 4
        self.attributes.greed = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
