//
//  RTTileCitadel.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileCitadel: RTTile {
    
    init(){
        super.init(imageNamed: "tileUrban")
        
        tileName = "The Grand Citadel"
        tileDescription = "Big city, with lots of streets and alleys, and also lost travelers."
        tileType = TileType.Urban
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(100) + 1
            var base: UInt32
            
            // (Heal 75% - Theft 25%)
            
            if random > 25{
                // HEAL
                base = arc4random_uniform(20)
                GEventManager!.callEventHeal(Int(base))
            }
            else if random >= 1{
                // THEFT
                base = arc4random_uniform(10)
                GEventManager!.callEventTheft(Int(base))
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
