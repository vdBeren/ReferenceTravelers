//
//  RTTextWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 10/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTTextWindow: RTWindow{
   
    init(){
        super.init(imageNamed: "windowText", background: false)
        self.windowPopUp?.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
