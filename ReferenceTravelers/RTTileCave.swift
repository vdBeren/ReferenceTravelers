//
//  RTTileCave.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTTileCave: RTTile {
   
    init(){
        super.init(imageNamed: "TILECAVE")
        
        tileDescription = "A misterious cave. What surprises it hides?"
        tileType = "EXPLORER"
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
                // ARMADILHA
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
