//
//  RTTileJungle.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileJungle: RTTile {
    
    init(){
        super.init(imageNamed: "tileExplorer")
        
        tileDescription = "A damp and beautifully dangerous place."
        tileType = TileType.Explorer
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(2)
            var base: UInt32
            
            // (Combat 60% - Treasure 40%)
            
            switch random{
            case 0:
                // TREASURE
                base = arc4random_uniform(12) + 1
                GEventManager!.callEventTreasure(Int(base))
                
            case 1:
                // COMBAT
                GEventManager!.callEventCombat()
                
            default:
                break
                
            }
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
