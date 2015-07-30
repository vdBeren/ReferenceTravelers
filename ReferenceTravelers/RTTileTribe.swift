//
//  RTTileTribe.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileTribe: RTTile {
   
    init(){
        super.init(imageNamed: "TILETRIBE")
        
        tileDescription = "You approach a wild tribe by accident. They aren't friendly."
        tileType = TileType.Explorer
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
                // COMBAT
                GEventManager!.callEventCombat()
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
