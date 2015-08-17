//
//  RTTileVolcano.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 14/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileVolcano: RTTile {
    init(){
        super.init(imageNamed: "tileArcane")
        
        tileName = "Dangerous Volcano"
        tileDescription = "Not the place you want to be."
        tileType = TileType.Arcane
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(100) + 1
            var base: UInt32
            
            //(Combat 80% - Disaster 20%)
            
            if random > 20{
                //COMBAT
                GEventManager!.callEventCombat()
            }
            else if random >= 1{
                //DISASTER
                let attribute = GHeroesManager!.currentHero.attributes.pickRandomAttribute()
                base = arc4random_uniform(3)
                GEventManager!.callEventDisaster(attribute, randomBase: Int(base))
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
