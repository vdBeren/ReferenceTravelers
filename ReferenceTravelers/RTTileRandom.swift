//
//  RTTileRandom.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 29/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileRandom: RTTile {
    
    init(){
        super.init(imageNamed: "tileNeutral")
        
        tileName = "Random Totem"
        tileDescription = "What will happen? Nobody knows for sure."
        tileType = TileType.Neutral
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(8)
            var base: UInt32
            
            // 1/8 de chance pra cada Evento
            
            switch random{
            case 0:
                // TREASURE
                base = arc4random_uniform(15)+1
                GEventManager!.callEventTreasure(Int(base))
            
            case 1:
                // THEFT
                base = arc4random_uniform(15)+1
                GEventManager!.callEventTheft(Int(base))
                
            case 2:
                // HEAL
                base = arc4random_uniform(10)+1
                GEventManager!.callEventHeal(Int(base))
                
            case 3:
                // TRAP
                base = arc4random_uniform(15)+1
                GEventManager!.callEventTrap(Int(base))
              
            case 4:
                // MIRACLE
                let attribute = GHeroesManager!.currentHero.attributes.pickRandomAttribute()
                base = arc4random_uniform(3)+1
                GEventManager!.callEventMiracle(attribute, randomBase: Int(base))
                
            case 5:
                // DISASTER
                let attribute = GHeroesManager!.currentHero.attributes.pickRandomAttribute()
                base = arc4random_uniform(3)+1
                GEventManager!.callEventDisaster(attribute, randomBase: Int(base))

            case 6:
                // COMBAT
                GEventManager!.callEventCombat()
                
            case 7:
                // NADA
                GEventManager!.callEventBlank()
                
            default:
                break
                
            }
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
