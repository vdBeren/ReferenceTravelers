//
//  RTTileWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 30/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTTileWindow: RTWindow {
   
    var tileArray: [RTTilePackCard] = []
    var setPicked: Bool = false
    
    init(){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: "EventWindow")
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "TILEWINDOW"
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.zPosition = 5
        self.userInteractionEnabled = true
        
        let explorer = RTTilePackCard(tileType: RTTile.TileType.Explorer)
        let urban = RTTilePackCard(tileType: RTTile.TileType.Urban)
        let arcane = RTTilePackCard(tileType: RTTile.TileType.Arcane)
        tileArray = [explorer, urban, arcane]
        
        for (index, tileCard) in enumerate(tileArray) {
            if index == 0{
                tileCard.anchorPoint = CGPoint(x: 1.5, y: 0.5)
            }
            else if index == 1{
                tileCard.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            }
            else{
                tileCard.anchorPoint = CGPoint(x: -0.5, y: 0.5)
            }
            self.addChild(tileCard)
            
        }
        
        self.introAnimation()

    }
    
    func setPackPicked(tileType: RTTile.TileType){
        
        if !setPicked{
            GBoardScene!.setPackPicked(tileType)
            self.closeWindow()
        }

        self.setPicked = true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
