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
            var random = arc4random_uniform(10)
            
            //(Combat 60% - Treasure 20% - Disaster 20%)
            
            if random >= 5{
                //COMBAT
                
            }
            else if random >= 3{
                //TREASURE
                
            }
            else if random >= 0{
                //DISASTER
                
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
