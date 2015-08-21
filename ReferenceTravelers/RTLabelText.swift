//
//  RTLabelText.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTLabelText: RTLabel {
   
    
    init(text: String, fontSize: CGFloat, minimum: Int){
        
        super.init(fontSize: fontSize)
        
        self.minimum = minimum
        self.finalText = text
        
    }
    
        

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
