//
//  RTTile.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTTile: RTHideRequired {
   
    var tileDescription: String = ""
    var tileType: String = ""
    var tileLevel: Int = 1
    var tileEvent: (Void) -> (Void) = {}
    
    
    init(imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "TILE"
        self.userInteractionEnabled = false
        
        self.setRTTileEvent { () -> () in
            fatalError("MUST OVERRIDE TILE EVENT")
        }

    }
    
    func setRTTileEvent(block: (Void)->(Void)) {
        self.tileEvent = block
    }
    
    
    //Recebe toques no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.tileEvent()
    }

    private func openEventWindow(windowName: String, description: String){
        let eventWindow = RTEventWindow(imageNamed: windowName, description: description)
        (self.parent as? RTBoardScene)?.addChild(eventWindow)
    }
    
    private func eventTreasure(randomBase: Int, description: String){
        //var gold: Int = GCurrentHeroAttributes.obtainGold(randomBase)
        self.openEventWindow("TREASURE", description: description)
    }
    
    private func eventCombat(descritpion: String){
        self.openEventWindow("COMBAT", description: description)
    }
    
    private func eventHeal(description: String){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
