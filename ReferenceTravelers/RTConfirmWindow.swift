//
//  RTConfirmWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 18/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTConfirmWindow: RTWindow {
    
    var buttonPlay, buttonBack: RTTextButton?
    var labelText, labelText2: RTLabelText?
    
    init(){
        
        super.init(imageNamed: "windowPopUp", background: false)
        
        self.name = "CONFIRMWINDOW"
        //self.anchorPoint = CGPoint(x: -0.5, y: -0.5)
        
        
        self.userInteractionEnabled = false
        
        //self.position = CGPoint(x: GSize.width/2, y: GSize.height/2)
        self.initContents()
        
        self.introAnimation()
        //self.floatingAnimation()
        
        
    }
    
    
    func initContents(){
        labelText = RTLabelText(text: "ARE YOU SURE?", fontSize: 46, minimum: 5)
        //self.labelText?.position = CGPoint(x: self.windowPopUp!.size.width, y: self.windowPopUp!.size.height)
        self.labelText?.position.y += self.size.height/12
        self.addChild(labelText!)
        self.labelText?.introAnimation()
        
        labelText2 = RTLabelText(text: "ALL PROGRESS WILL BE LOST.", fontSize: 38, minimum: 5)
        //self.labelText?.position = CGPoint(x: self.windowPopUp!.size.width, y: self.windowPopUp!.size.height)
        self.labelText2?.position.y += self.size.height/36
        self.addChild(labelText2!)
        self.labelText2?.introAnimation()
        
        let colors = [SKColor.whiteColor(), SKColor.whiteColor()]
        
        self.buttonBack = RTTextButton(imageNamed: "btnPopUp", actionOnTouchBegan: false, text: "OK, QUIT", fontSize: 32, minimum: 4, colors: colors, actionTime: 1.0)
        self.buttonBack!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.buttonBack!.position.x -= self.size.width/7
        self.buttonBack!.position.y -= self.size.height/10
        
        self.addChild(self.buttonBack!)
        
        self.buttonPlay = RTTextButton(imageNamed: "btnPopUp", actionOnTouchBegan: false, text: "NO, STAY", fontSize: 32, minimum: 4, colors: colors, actionTime: 1.0)
        self.buttonPlay!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.buttonPlay!.position.x += self.size.width/7
        self.buttonPlay!.position.y -= self.size.height/10
        
        self.buttonPlay!.setRTButtonAction { () -> () in
            self.closeWindow()
        }
        
        self.addChild(self.buttonPlay!)
    }
    
    
    func setWindowBackButton( block: ()->() ){
        self.buttonBack!.buttonAction = block
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
