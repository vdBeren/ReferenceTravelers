//
//  RTTileCave.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTTileCave: RTTile {
   
    init(){
        super.init(imageNamed: "tileExplorer")
        
        tileName = "The Cave"
        tileDescription = "A misterious cave. What surprises it hides?"
        tileType = TileType.Explorer
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(3)
            var base: UInt32
            
            // (Treasure 33% - Combat 33% - Trap 33%)
            
            switch random{
            case 0:
                // TREASURE
                base = arc4random_uniform(15) + 1
                GEventManager!.callEventTreasure(Int(base))
                
            case 1:
                // COMBAT
                GEventManager!.callEventCombat()
                
            case 2:
                // TRAP
                base = arc4random_uniform(30) + 1
                GEventManager!.callEventTrap(Int(base))
                
            default:
                break
                
            }
        }
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
