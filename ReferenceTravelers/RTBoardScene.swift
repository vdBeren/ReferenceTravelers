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
    var buttonAdvance: RTButton?
    var labelTileName, labelTileDescription: RTLabelText?
    var heroDisplay: RTSelectable?
    
    var currentTile: RTTile = RTTileBlank()
    var lastTile: RTTile = RTTileBlank()
    
    var boardPath: [RTTile] = []
    var boardPathIndex: Int = 0
    
    var fontSize: CGFloat = 30.0
    
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        self.initBoard()
        
    }
    
    private func initBoard(){
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: GStageManager!.currentStage.backgroundImage)
        // backgroundNode!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(backgroundNode!)
        
        // Adiciona o tile inicial do tabuleiro e o faz o primeiro e o último.
        let tileStart = RTTileStart()
        self.addTile(tileStart)
        self.changeTilesSize()
        
        self.currentTile = tileStart
        self.lastTile = tileStart
        
        // Botão de Avançar
        self.buttonAdvance = RTButton(imageNamed: "btnSettings", actionOnTouchBegan: false, actionTime: 0.2)
        self.buttonAdvance!.position = CGPoint(x: self.size.width/1.2, y: self.size.height/10)
        self.buttonAdvance!.setRTButtonAction { () -> () in
            self.advanceButtonAction()
        }
        self.addChild(buttonAdvance!)
        
        // Label de Nome e Descrição dos Tiles
        self.labelTileName = RTLabelText(text: currentTile.tileName, fontSize: fontSize, minimum: 15)
        self.labelTileName?.position = CGPoint(x: self.size.width/2, y: self.size.height/1.4)
        self.addChild(labelTileName!)
        
        self.labelTileDescription = RTLabelText(text: currentTile.tileDescription, fontSize: fontSize, minimum: 20)
        self.labelTileDescription?.position = CGPoint(x: self.size.width/2, y: self.size.height/4)
        self.addChild(labelTileDescription!)
        
        self.updateTileInfo()
        
        // Adiciona gráfico do heroi no mapa
        heroDisplay = RTSelectable(imageNamed: GHeroesManager!.currentHero.imageName)
        self.heroDisplay?.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.heroDisplay?.runAction(SKAction.scaleXTo(-0.75, y: 0.75, duration: 0.0))
        self.heroDisplay?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.heroDisplay?.userInteractionEnabled = false
        self.heroDisplay?.zPosition += 1
        self.addChild(heroDisplay!)
        
        self.userInteractionEnabled = true

    }
    
    // Desabilita/Habilita os nodes que possuem interação.
    func disableNodes(#enabled: Bool){
        self.buttonAdvance?.userInteractionEnabled = enabled
    }
    
    // Adiciona um pack de tiles ao tabuleiro e os posiciona na tela andando pra direita (Recuando).
    func setPackPicked(tileType: RTTile.TileType){
        
        let newPath = GTileManager!.pickTileSet(tileType)
        var posX, sizeX: CGFloat
        
        for (index, tile) in enumerate(newPath){
            self.addTile(tile)
            
            posX = tile.position.x
            sizeX = 128
            
            tile.moveTileToPosition(posX + (sizeX * CGFloat(index + 1)) + sizeX/2)
            self.lastTile = tile // Faz com que o último do loop tome a posição de último
        }
        
        self.changeTilesSize()
        
    }
    
    
    private func updateTileInfo(){
        self.labelTileName?.setLabelText(currentTile.tileName)
        self.labelTileName?.introAnimation()
        
        self.labelTileDescription?.setLabelText(currentTile.tileDescription)
        self.labelTileDescription?.introAnimation()
        
    }
    
    // Atualiza o tabuleiro, mudando seu index, movendo os tiles e selecionando o tile atual.
    private func updateBoard(){
        self.boardPathIndex++
        self.moveTiles()
        self.changeTilesSize()
        self.updateTileInfo()
        
    }
    
    
    private func advanceButtonAction(){
        if !currentTile.tileUsed{
            //  CHAMA EVENTO DO TILE ATUAL
            currentTile.tileEvent()
            
            self.disableNodes(enabled: false)
            
        }
        else if currentTile == lastTile{
            // CHAMA JANELA DE PACK
            let tileWindow = RTTileWindow()
            tileWindow.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            self.addChild(tileWindow)
    
            self.disableNodes(enabled: false)
        }
        else{ // Está usado e não é o último
            self.updateBoard()
        }
        
    }
    
    // Adiciona um tile ao tabuleiro / scene
    private func addTile(tile: RTTile){
        boardPath.append(tile)
        tile.introAnimation()
        tile.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        //tile.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(tile)
    }
    
    
    // Move os tiles pra esquerda (Avançando)
    private func moveTiles(){
        
        var posX, sizeX: CGFloat
        
        for (index, tile) in enumerate(boardPath){
            
            
            posX = tile.position.x
            sizeX = 128
            
            if index == boardPathIndex || index == boardPathIndex-1{
                sizeX = 192
            }
            
            if index == boardPathIndex{
                self.currentTile = tile
            }
            
            tile.moveTileToPosition((posX - sizeX))
        }
        
    }
    
    
    // Muda o tamanho dos tiles para mostrar o atual.
    private func changeTilesSize(){
        for (index, tile) in enumerate(boardPath){
            
            if index == boardPathIndex{
                tile.changeTileSizeAnimation(shrink: false)
                // tile.userInteractionEnabled = true
            }
            else{
                tile.changeTileSizeAnimation(shrink: true)
                //  tile.userInteractionEnabled = false
            }
            
        }
        
    }
    
    
    
    //Chamado a todo frame. Usado para realizar o update dos nodes da Scene, em cascata.
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
    }
    
    
    //Recebe toques na Scene.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        // self.updateBoard()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
