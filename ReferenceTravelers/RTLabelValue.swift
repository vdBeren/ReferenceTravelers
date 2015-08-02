//
//  RTLabelValue.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 1/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// RTLabel que tem outro RTLabel de valor inteiro ao seu lado.

class RTLabelValue: RTLabel {
   
    var labelValue: RTLabel?
    
    init(text: String, value: Int, fontSize: CGFloat){
        
        super.init(fontSize: fontSize)
        
        self.minimum = 7
        self.finalText = text
        
        self.labelValue = RTLabelText(text: String(value), fontSize: fontSize, minimum: 2)
        self.labelValue!.fontColor = SKColor.whiteColor()
        self.labelValue!.fontSize = fontSize
        self.labelValue!.position.x += 180
        self.labelValue!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        self.addChild(labelValue!)
        
       
        
        self.labelValue!.introAnimation()
        
    }
    
    func setValue(value: Int){
        self.labelValue!.text = String(value)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
