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
        tileType = "ARCANE"
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            var random = arc4random_uniform(3)
            
            switch random{
            case 0:
                // TESOURO
                break
            case 1:
                // COMBATE
                break
            case 2:
                // CATASTROFE
                break
            default:
                break
                
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
