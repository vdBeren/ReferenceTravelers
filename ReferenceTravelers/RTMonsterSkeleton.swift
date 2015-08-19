//
//  RTMonsterSkeleton.swift
//  ReferenceTravelers
//
//  Created by Bruno de Paula Munhoz on 14/08/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTMonsterSkeleton: RTMonster {
    init(){
        
        super.init(imageNamed: "skeleton")
        
        self.name = "SKELETON"
    }
    
    override func update() {
       
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
