//
//  RTStageAngelGrove.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTStageAngelGrove: RTStage {
    init(){
        super.init(imageNamed: "coverMedieval")
        
        self.backgroundImage = "bgAngelGrove"
        
        self.locked = true
        
        self.title = "ANGEL GROVE"
        self.information = "Colorful warriors, choreographies, big robots, big monsters and stuff."
        
        self.difficulty = RTStage.Difficulty.Hard
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
