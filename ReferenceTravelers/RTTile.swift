//
//  RTTile.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe de Tiles. Um Tile chama uma Janela de Evento, passando um Evento, os Valores e Ações.

class RTTile: RTHideRequired {
   
    var tileDescription: String = ""
    var tileType: RTTile.TileType = TileType.Neutral
    var tileLevel: Int = 1
    var tileEvent: (Void) -> (Void) = {}
    
    enum TileType : String{
        case Explorer = "EXPLORER"
        case Urban = "URBAN"
        case Arcane = "ARCANE"
        case Neutral = "NEUTRAL"
    }
    
    init(imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "TILE"
        self.userInteractionEnabled = true
        
        self.setRTTileEvent { () -> () in
            fatalError("MUST OVERRIDE TILE EVENT")
        }

    }
    
    func setRTTileEvent(block: (Void)->(Void)) {
        self.tileEvent = block
    }
    
    
    //Recebe toques no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.tileEvent()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
