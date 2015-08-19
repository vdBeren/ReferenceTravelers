//
//  RTTileManager.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 29/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit


// TODO: Ler os tiles a partir de um arquivo, de forma a ficar mais simples de adicionar novos tipos de tiles.

class RTTileManager: NSObject {
    
    var tilesLevel: Int = 0
    
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
    
    func levelUpTiles(){
        self.tilesLevel++
    }
    
    func resetTiles(){
        self.tilesLevel = 0
    }
    
    func getTilesLevelAsString() -> String{
        if tilesLevel >= 10{
            return "\(self.tilesLevel)"
        }
        return ("0\(self.tilesLevel)")
    }
    
    func pickTile(tileType: RTTile.TileType) -> RTTile{
        
        var tile: RTTile
        
        switch tileType{
        case RTTile.TileType.Explorer:
            tile = arrayExplorer.pickRandomItem()
            tile = tile.copy() as! RTTile
            
        case RTTile.TileType.Urban:
            tile = arrayUrban.pickRandomItem()
            tile = tile.copy() as! RTTile
            
        case RTTile.TileType.Arcane:
            tile = arrayArcane.pickRandomItem()
            tile = tile.copy() as! RTTile
            
        case RTTile.TileType.Neutral:
            tile = arrayNeutral.pickRandomItem()
            tile = tile.copy() as! RTTile
            
        default:
            break
        }
        
        return tile
    }
    
    func pickTileSet(tileType: RTTile.TileType) -> [RTTile]{
        
        var tileArray: [RTTile] = []
        var tile: RTTile
        
        for i in 0...1{
            
            tile = self.pickTile(tileType)
            tileArray.append(tile)
            
        }
        
        tileArray.append(self.pickTile(RTTile.TileType.Neutral))
        tileArray.shuffle()
        
        return tileArray
    }
    
    private func packExplorer(){
        
        let tileCave = RTTileCave()
        let tileTribe = RTTileTribe()
        let tileJungle = RTTileJungle()
        
        let arrayTiles = [tileCave, tileTribe, tileJungle]
        
        for tile in arrayTiles{
            arrayExplorer.append(tile)
        }
        
    }
    
    private func packUrban(){
        
        let tileVillage = RTTileVillage()
        let tileCitadel = RTTileCitadel()
        let tileGraveyard = RTTileGraveyard()
        
        let arrayTiles = [tileVillage, tileCitadel, tileGraveyard]
        
        for tile in arrayTiles{
            arrayUrban.append(tile)
        }
        
    }
    
    private func packArcane(){
        
        let tileLair = RTTileLair()
        let tileVolcano = RTTileVolcano()
        let tileLaboratory = RTTileLaboratory()
        
        let arrayTiles = [tileLair, tileVolcano, tileLaboratory]
        
        for tile in arrayTiles{
            arrayArcane.append(tile)
        }
        
    }

    private func packNeutral(){
       
        let tileRandom = RTTileRandom()
        let tileJudgement = RTTileJudgement()
        let tileBlank = RTTileBlank()
        
        let arrayTiles = [tileRandom, tileJudgement, tileBlank]
        
        for tile in arrayTiles{
            arrayNeutral.append(tile)
        }
        
        
    }

}

//MARK: Shuffle Array
extension Array {
    mutating func shuffle() {
        if count < 2 { return }
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
}

//MARK: Contains in Array
extension Array {
    func contains<T where T : Equatable>(obj: T) -> Bool {
        return self.filter({$0 as? T == obj}).count > 0
    }
}

