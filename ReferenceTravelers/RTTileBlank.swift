//
//  RTTileBlank.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileBlank: RTTile {
    
    init(){
        super.init(imageNamed: "tileNeutral")
        
        tileName = "An empty field"
        tileDescription = "Nothing to see here. Or is it?"
        tileType = TileType.Neutral
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            GEventManager!.callEventBlank()
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
