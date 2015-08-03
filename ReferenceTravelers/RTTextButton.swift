//
//  RTTextButton.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Botão que tem um label de texto como componente.

class RTTextButton: RTButton {
   
    var labelText: RTLabelText?
    var mainColor, secondaryColor: SKColor?
    
    init(imageNamed imageName: String, actionOnTouchBegan: Bool, text: String, fontSize: CGFloat, minimum: Int, colors: [SKColor]) {
        
        super.init(imageNamed: imageName, actionOnTouchBegan: actionOnTouchBegan)
        
        self.mainColor = colors[0]
        self.secondaryColor = colors[1]
        
        labelText = RTLabelText(text: text, fontSize: fontSize, minimum: minimum)
        labelText!.fontColor = SKColor.orangeColor()
        self.addChild(labelText!)
        
        self.labelText!.introAnimation()
    }

    //Função que troca o texto da label quando pressionado.
    override func setButtonPressed(){
        if buttonPressed{
            labelText!.fontColor = self.mainColor!
            
        }
        else{
            labelText!.fontColor = self.secondaryColor!
        }
        
        buttonPressed = !buttonPressed
    }


    
    func blinkAnimation(){
        let blink = SKAction.runBlock({self.changeLabelColor()})
        let wait = SKAction.waitForDuration(0.6)
        let sequence = SKAction.sequence([blink, wait])
        let forever = SKAction.repeatActionForever(sequence)
        
        self.runAction(forever)
        
    }
    
    private func changeLabelColor(){
        
        if self.labelText!.fontColor == self.mainColor!{
            self.labelText!.fontColor = self.secondaryColor!
        }
        else{
            self.labelText!.fontColor = self.mainColor!
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
}
