//
//  RTStage.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTStage: RTSelectable {
    var difficulty: RTStage.Difficulty = RTStage.Difficulty.Easy
    var title: String = ""
    var information: String = ""
    
    enum Difficulty : String{
        case Easy = "EASY BREEZY"
        case Normal = "NORMAL"
        case Hard = "HARDER THAN YOUR HEART"
        case Expert = "REFERENCE EXPERT"
    }
    
    override init(imageNamed imageName:String){
        
        super.init(imageNamed: imageName)
        
        self.imageName = imageName
        
        self.name = "STAGE"
        self.userInteractionEnabled = false

    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
