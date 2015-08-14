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
   
    var tileName: String = ""
    var tileDescription: String = ""
    var tileType: RTTile.TileType = TileType.Neutral
    var tileLevel: Int = 1
    var tileEvent: (Void) -> (Void) = {}
    
    var tileUsed: Bool = false
    
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
        self.userInteractionEnabled = false
        
        self.setRTTileEvent { () -> () in
            fatalError("MUST OVERRIDE TILE EVENT")
        }

    }
    
    func setRTTileEvent(block: (Void)->(Void)) {
        self.tileEvent = block
    }
    
    func setTileUsed(){
        self.tileUsed = true
        
        let alpha = SKAction.fadeAlphaTo(0.5, duration: 0.5)
        self.runAction(alpha)
    }
    
    //Recebe toques no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.tileEvent()
    }

    
    func introAnimation(){
        var scale: CGFloat = 0.1
        var duration: NSTimeInterval = 0.0
        let scaleActionBegin = SKAction.scaleTo(scale, duration: duration)
        
        scale = 0.5
        duration = 0.2
        let scaleActionEnd = SKAction.scaleTo(scale, duration: duration)
        
        let sequenceArray = SKAction.sequence([scaleActionBegin, scaleActionEnd])
        self.runAction(sequenceArray)
    }
    
    func changeTileSizeAnimation(#shrink: Bool){
        
        let sequenceAction: SKAction
        let scaleActionShrink: SKAction
        let scaleActionEnlarge: SKAction
        
        if shrink {
            scaleActionEnlarge = SKAction.scaleTo(0.5, duration: 0.2)
            scaleActionShrink = SKAction.scaleTo(0.5, duration: 0.2)
        }
        else{
            scaleActionEnlarge = SKAction.scaleTo(1.3, duration: 0.2)
            scaleActionShrink = SKAction.scaleTo(1.0, duration: 0.2)
        }

        sequenceAction = SKAction.sequence([scaleActionEnlarge, scaleActionShrink])
        
        self.runAction(sequenceAction)
        
    }
    
    func moveTileToPosition(x: CGFloat){
        
        let move = SKAction.moveToX(x, duration: 0.5)
        self.runAction(move)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
