//
//  RTTileLair.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileLair: RTTile {
    init(){
        super.init(imageNamed: "TILELAIR")
        
        tileDescription = "Some ancient creature lair. Great treasures, great dangers."
        tileType = TileType.Arcane
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(100) + 1
            var base: UInt32
            
            //(Combat 60% - Treasure 20% - Disaster 20%)
            
            if random > 40{
                //COMBAT
                GEventManager!.callEventCombat()
            }
            else if random > 20{
                //TREASURE
                base = arc4random_uniform(30)
                GEventManager!.callEventTreasure(Int(base))
            }
            else if random >= 1{
                //DISASTER
                let attribute = GCurrentHero.attributes.pickRandomAttribute()
                base = arc4random_uniform(3)
                GEventManager!.callEventDisaster(attribute, randomBase: Int(base))
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
