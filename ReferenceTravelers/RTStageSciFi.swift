//
//  RTStageSciFi.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTStageSciFi: RTStage {
    init(){
        super.init(imageNamed: "coverMedieval")
        
        self.locked = true
        
        self.title = "STAR BATTLES"
        self.information = "Laser swords, clones, robots and stuff."
        
        self.difficulty = RTStage.Difficulty.Normal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
