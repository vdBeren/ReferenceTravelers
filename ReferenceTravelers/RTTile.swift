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
    //var tileHeroStats: RTAttributes = RTAttributes()
    
    
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

    
    private func treasureEvent() -> Int{
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
