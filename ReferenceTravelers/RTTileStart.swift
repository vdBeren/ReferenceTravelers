//
//  RTTileStart.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 5/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileStart: RTTile {
    init(){
        super.init(imageNamed: "tileNeutral")
        
        tileName = "Start Point"
        tileDescription = "Where you start. What lies ahead in your adventure?"
        tileType = TileType.Neutral
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            // Começa o jogo!
            GEventManager!.callEventStart()

        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
