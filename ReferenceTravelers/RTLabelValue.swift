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
   
    var labelValue: RTLabelText?
    
    // Inicia a Label de valor com posição Horizontal em relação ao Label de texto.
    init(text: String, value: Int, fontSize: CGFloat, valueXAlign: CGFloat){
        
        super.init(fontSize: fontSize)
        
        self.minimum = 7
        self.setLabelText(text)
        
        self.labelValue = RTLabelText(text: String(value), fontSize: fontSize, minimum: 2)
        self.labelValue!.fontColor = SKColor.whiteColor()
        self.labelValue!.fontSize = fontSize
        self.labelValue!.position.x += valueXAlign
        self.labelValue!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        self.addChild(labelValue!)
        
       
        
        self.labelValue!.introAnimation()
        
    }
    
    // Inicia a Label de valor com posições Horizontais e Verticais em relação ao Label de texto.
    init(text: String, value: Int, fontSize: CGFloat, valueXAlign: CGFloat, valueYAlign: CGFloat){
        
        super.init(fontSize: fontSize)
        
        self.minimum = 7
        self.setLabelText(text)
        
        self.labelValue = RTLabelText(text: String(value), fontSize: fontSize, minimum: 2)
        self.labelValue!.fontColor = SKColor.whiteColor()
        self.labelValue!.fontSize = fontSize
        self.labelValue!.position.x += valueXAlign
        self.labelValue!.position.y += valueYAlign
        self.labelValue!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        self.addChild(labelValue!)
        
        
        
        self.labelValue!.introAnimation()
        
    }

    
    func setValue(value: Int){
        self.labelValue!.setLabelText(String(text))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
