//
//  RTButton.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 16/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTButton: RTHideRequired {
    
    var buttonAction: (Void) -> (Void) = {}
    var buttonPressed: Bool = false
    var buttonImageName: String
    
    init (imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        buttonImageName = imageName
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "BUTTON"
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.zPosition = 0
        self.userInteractionEnabled = true
        
    }
    
    func setButtonTexture(){
        if buttonPressed{
            self.texture = SKTexture(imageNamed: buttonImageName)
        }
        else{
            self.texture = SKTexture(imageNamed: buttonImageName + "-t")
        }
        
        buttonPressed = !buttonPressed
    }
    
    func setRTButtonAction(block: (Void)->(Void)) {
        self.buttonAction = block
    }
    
    //Recebe toques na tela no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        setButtonTexture()
        //println("CLICOU NO NODE")
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        setButtonTexture()
        self.buttonAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
