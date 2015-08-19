//
//  RTLabelValueHud.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 18/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// RTLabel que tem outro RTLabel de valor inteiro ao seu lado e junto outro RTLabel auxiliar com outro valor.
// Para ser usado na HUD, para mostrar HP / HPMax ou STR -/+ STRExtra.

class RTLabelValueHud: RTLabel {
    
    var labelValue, labelValueAux: RTLabelText?
    
    init(text: String, value: Int, valueAux: Int, fontSize: CGFloat, xAlign: CGFloat){
        
        super.init(fontSize: fontSize)
        
        self.minimum = 7
        self.setLabelText(text)
        
        // Configura e adiciona label de valor.
        self.labelValue = RTLabelText(text: String(value), fontSize: fontSize, minimum: 2)
        self.labelValue!.fontColor = SKColor.whiteColor()
        self.labelValue!.fontSize = fontSize
        self.labelValue!.position.x += xAlign
        self.labelValue!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        self.addChild(labelValue!)
        self.labelValue!.introAnimation()
        
        
        // Configura e adiciona label de valor auxiliar (maxHealth, stats extras)
        let auxText = "/ \(valueAux)"
        
        self.labelValueAux = RTLabelText(text: auxText, fontSize: fontSize, minimum: 2)
        self.labelValueAux!.fontColor = SKColor.whiteColor()
        self.labelValueAux!.fontSize = fontSize
        self.labelValueAux!.position.x += xAlign*2
        self.labelValueAux!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        self.addChild(labelValueAux!)
        self.labelValueAux!.introAnimation()
        
        
    }
    
    
    func setValues(value: Int, valueAux: Int){
        self.labelValue!.setLabelText(String(value))
        self.labelValueAux?.setLabelText(String(valueAux))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
