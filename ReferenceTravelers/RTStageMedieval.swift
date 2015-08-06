//
//  RTStageMedieval.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTStageMedieval: RTStage {
    
    init(){
        super.init(imageNamed: "coverMedieval")
        
        self.backgroundImage = "bgMedieval"
        
        self.locked = false
        
        self.title = "RPG MAKER MEDIEVAL FANTASY"
        self.information = "Kings, knights, princess, dragons, magic and stuff. "
        
        self.difficulty = RTStage.Difficulty.Easy
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
