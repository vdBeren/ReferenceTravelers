//
//  RTBoardScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe da cena do Tabuleiro. Gerencia os tiles e suas mecânicas.

class RTBoardScene: SKScene {
    
    var backgroundNode: RTBackground?
    var boardPath: [RTTile] = []
    var boardPathIndex: Int = 0
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bg0")
        backgroundNode!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(backgroundNode!)
        
        let tile = RTTileCave()
        self.addTile(tile, count: -1)
        
        self.changeTilesSize()
        
        let tileWindow = RTTileWindow()
        self.addChild(tileWindow)
        
        let button: RTButton = RTButton(imageNamed: "btnAction", actionOnTouchBegan: true, actionTime: 0.2)
        self.position.y -= 300
        button.setRTButtonAction { () -> () in
            let tileWindow = RTTileWindow()
            self.addChild(tileWindow)
        }
        self.addChild(button)
        
        self.userInteractionEnabled = true
        
    }
    
    func setPackPicked(tileType: RTTile.TileType){
        
        let newPath = GTileManager!.pickTileSet(tileType)
        var posX, sizeX: CGFloat
        
        for (index, tile) in enumerate(newPath){
            self.addTile(tile, count: index)
            
            posX = tile.position.x
            sizeX = 128
            
            tile.moveTileToPosition(posX + (sizeX * CGFloat(index + 1)) + sizeX/2)
        }
        
        self.changeTilesSize()
    }
    
    private func addTile(tile: RTTile, count: Int){
        boardPath.append(tile)
        tile.introAnimation()
        tile.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(tile)
    }
    
    private func updateBoard(){
        self.boardPathIndex++
        self.moveTiles()
        self.changeTilesSize()
    }
    
    private func moveTiles(){
        var posX, sizeX: CGFloat
        
        for (index, tile) in enumerate(boardPath){
            
            var moveIndex: Int = index
            
            posX = tile.position.x
            sizeX = 128
            if index == boardPathIndex || index == boardPathIndex-1{
                sizeX = 192
            }
            tile.moveTileToPosition((posX - sizeX))
            
            
        }
    }
    
    private func changeTilesSize(){
        for (index, tile) in enumerate(boardPath){
            
            if index == boardPathIndex{
                tile.changeTileSizeAnimation(shrink: false)
                tile.userInteractionEnabled = true
            }
            else{
                tile.changeTileSizeAnimation(shrink: true)
                tile.userInteractionEnabled = false
            }
            
        }
        
    }
    
    
    
    //Chamado a todo frame. Usado para realizar o update dos nodes da Scene, em cascata.
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
    }
    
    
    //Recebe toques na Scene.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

        self.updateBoard()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
