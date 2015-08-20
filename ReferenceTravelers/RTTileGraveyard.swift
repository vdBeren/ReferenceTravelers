//
//  RTTileGraveyard.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileGraveyard: RTTile {
   
    init(){
        super.init(imageNamed: "tileUrban")
        
        tileName = "Graveyard"
        tileDescription = "Graves and tombs. Not friendly at night. Nor day."
        tileType = TileType.Urban
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(100) + 1
            var base: UInt32
            
            // (Combat 75% - Theft 25%)
            
            if random > 25{
                // COMBAT
                GEventManager!.callEventCombat()
            }
            else if random >= 1{
                base = arc4random_uniform(10)
                GEventManager!.callEventTheft(Int(base))
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
