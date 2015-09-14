//
//  RTTileLaboratory.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 14/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileLaboratory: RTTile {
    init(){
        super.init(imageNamed: "tileArcane")
        
        tileName = "Arcane Laboratory"
        tileDescription = "Be careful. Think before you act. Magic."
        tileType = TileType.Arcane
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(100) + 1
            var base: UInt32
            
            //(Combat 40% - Trap 30% - Miracle 30%)
            
            if random > 60{
                //COMBAT
                GEventManager!.callEventCombat()
            }
            else if random > 30{
                // TRAP
                base = arc4random_uniform(20) + 1
                GEventManager!.callEventTrap(Int(base))
            }
            else if random >= 1{
                // MIRACLE
                let attribute = GHeroesManager!.currentHero.attributes.pickRandomAttribute()
                base = arc4random_uniform(3)+1
                GEventManager!.callEventMiracle(attribute, randomBase: Int(base))
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
