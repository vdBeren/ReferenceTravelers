//
//  RTTileVillage.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTTileVillage: RTTile {
    init(){
        super.init(imageNamed: "TILEVILLAGE")
        
        tileDescription = "A peacefull village, with an Inn for adventurers."
        tileType = TileType.Urban
        tileLevel = 1
        
        //Ação do Tile
        self.setRTTileEvent { () -> () in
            // HEAL
            var base = arc4random_uniform(10)
            GEventManager!.callEventHeal(Int(base))
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
