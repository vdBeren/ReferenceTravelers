//
//  RTTilePackCard.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTTilePackCard: RTHideRequired {
    
    var tileType: RTTile.TileType
    
    init(tileType: RTTile.TileType){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: tileType.rawValue + "-packCard")
        let size = texture.size()
        
        self.tileType = tileType
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "TILEPACKCARD"
        self.userInteractionEnabled = true
        
        self.floatingAnimation()
        
    }
    
    func floatingAnimation(){
        
        // EFEITO DE ANIMAÇÃO AO FICAR NA TELA :)
        
        var waitTime: NSTimeInterval = 1.2
        var move: CGFloat = 6.0
        
        let moveUp = SKAction.moveByX(0.0, y: move, duration: waitTime)
        let moveDown = SKAction.moveByX(0.0, y: -move, duration: waitTime)
        let sequence = SKAction.sequence([moveUp, moveDown])
        
        self.runAction(SKAction.repeatActionForever(sequence))
    }

    
    //Recebe toques no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        //println(tileType.rawValue)
        
        (self.parent as? RTTileWindow)?.setPackPicked(self.tileType)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
