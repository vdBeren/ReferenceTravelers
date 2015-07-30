//
//  RTTileManager.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 29/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTTileManager: NSObject {
    
    var tilesLevel: Int = 1
    
    //Arrays de Tipos de Tiles
    var arrayExplorer: [RTTile] = []
    var arrayUrban: [RTTile] = []
    var arrayArcane: [RTTile] = []
    var arrayNeutral: [RTTile] = []
    
    override init(){
        
        super.init()
        
        self.packExplorer()
        self.packUrban()
        self.packArcane()
        self.packNeutral()
        
    }
    
    func pickTile(tileType: RTTile.TileType) -> RTTile{
        
        switch tileType{
        case RTTile.TileType.Explorer:
            return arrayExplorer.pickRandomItem()
            
        case RTTile.TileType.Urban:
            return arrayUrban.pickRandomItem()
            
        case RTTile.TileType.Arcane:
            return arrayArcane.pickRandomItem()
            
        case RTTile.TileType.Neutral:
            return arrayNeutral.pickRandomItem()
            
        default:
            break
        }
    }
    
    func packExplorer(){
        
        let tileCave = RTTileCave()
        let tileTribe = RTTileTribe()
        let tileJungle = RTTileJungle()
        
        let arrayTiles = [tileCave, tileTribe, tileJungle]
        
        for tile in arrayTiles{
            arrayExplorer.append(tile)
        }
        
    }
    
    func packUrban(){
        
        let tileVillage = RTTileVillage()
        let tileCitadel = RTTileCitadel()
        let tileGraveyard = RTTileGraveyard()
        
        let arrayTiles = [tileVillage, tileCitadel, tileGraveyard]
        
        for tile in arrayTiles{
            arrayUrban.append(tile)
        }
        
    }
    
    func packArcane(){
        
        let tileLair = RTTileLair()
        
        let arrayTiles = [tileLair]
        
        for tile in arrayTiles{
            arrayArcane.append(tile)
        }
        
    }

    func packNeutral(){
       
        let tileRandom = RTTileRandom()
        let tileJudgement = RTTileJudgement()
        let tileBlank = RTTileBlank()
        
        let arrayTiles = [tileRandom, tileJudgement, tileBlank]
        
        for tile in arrayTiles{
            arrayNeutral.append(tile)
        }
        
        
    }

}
