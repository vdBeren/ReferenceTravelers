//
//  RTTileJudgement.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileJudgement: RTTile {
    
    init(){
        super.init(imageNamed: "TILEJUDGEMENT")
        
        tileDescription = "The gods will now judge you."
        tileType = TileType.Neutral
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(2)
            var base: UInt32
            
            // (Miracle 50% - Disaster 50%)
            
            switch random{
            case 0:
                // MIRACLE
                let attribute = GHeroesManager!.currentHero.attributes.pickRandomAttribute()
                base = arc4random_uniform(3)
                GEventManager!.callEventMiracle(attribute, randomBase: Int(base))

            case 1:
                // DISASTER
                let attribute = GHeroesManager!.currentHero.attributes.pickRandomAttribute()
                base = arc4random_uniform(3)
                GEventManager!.callEventDisaster(attribute, randomBase: Int(base))
                
            default:
                break
                
            }
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
