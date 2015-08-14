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
        
        super.init(imageNamed: "windowTilePack", background: true)
        
        self.name = "TILEWINDOW"
        
        self.zPosition += 1
        self.userInteractionEnabled = true
        
        //self.windowPopUp!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.initWindow()
    }
    
    func initWindow(){
        
        let sizeX = self.windowPopUp!.size.width/3
        let sizeY = self.windowPopUp!.size.height/5
        
        let explorer = RTTilePackCard(tileType: RTTile.TileType.Explorer)
        let urban = RTTilePackCard(tileType: RTTile.TileType.Urban)
        let arcane = RTTilePackCard(tileType: RTTile.TileType.Arcane)
        tileArray = [explorer, urban, arcane]
        //tileArray.shuffle()
        
        for (index, tileCard) in enumerate(tileArray) {
            tileCard.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            tileCard.position.y -= sizeY
            
            if index == 0{
                tileCard.position.x -= sizeX
            }
            else if index == 1{
                //tileCard.position.x -= sizeX/2
            }
            else{
                tileCard.position.x += sizeX
            }
            self.addChild(tileCard)
            
        }
        
        self.introAnimation()

    }
    
    func setPackPicked(tileType: RTTile.TileType){
        
        if !setPicked{
            GBoardScene!.setPackPicked(tileType)
            GTileManager!.levelUpTiles()
            self.closeWindow()
        }

        self.setPicked = true
        
        let wait = SKAction.waitForDuration(1.0)
        let block = SKAction.runBlock({self.setPicked = false})
        let sequence = SKAction.sequence([wait, block])
        
        self.runAction(sequence)
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
