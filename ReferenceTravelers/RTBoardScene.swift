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

// KNOWN BUGS: Apertar Skip, logo após tela de Pack, movimenta um a mais.


class RTBoardScene: SKScene {
    
    var backgroundNode: RTBackground?
    var buttonPause: RTButton?
    var buttonAdvance, buttonSkip: RTTextButton?
    var labelTileName, labelTileDescription, labelLv, labelLevelValue: RTLabelText?
    var blackStrip: SKSpriteNode?
    var heroDisplay: RTSelectable?
    
    var boardHud: RTHud?
    
    var pauseWindow: RTPauseWindow?
    
    var currentTile: RTTile = RTTileBlank()
    var lastTile: RTTile = RTTileBlank()
    
    var boardPath: [RTTile] = []
    var boardPathIndex: Int = 0
    
    var tileMargin: CGFloat = 128
    var fontSize: CGFloat = 30.0
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        self.initBoard()
        
    }
    
    func initHud(){
        boardHud = RTHud()
        self.boardHud?.windowPopUp!.position.y = self.size.height
        self.boardHud?.windowPopUp?.zPosition -= 1
        self.addChild(boardHud!)
    }
    
    func refresehHud(){
        self.boardHud?.refreshContents()
    }
    
    func initBoard(){
        
        // Limpa a scene do tabuleiro e reseta variaveis.
        self.removeAllChildren()
        self.removeAllActions()
        
        self.boardPath.removeAll(keepCapacity: false)
        self.boardPathIndex = 0
        GTileManager!.resetTiles()
        
        //--------------------------------------------------------------------------
        //Background da Scene
        
        self.backgroundNode = RTBackground(imageNamed: GStageManager!.currentStage.backgroundImage)
        // backgroundNode!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundNode?.zPosition -= 2
        self.addChild(self.backgroundNode!)
        
        // Faixa de fundo
        self.blackStrip = SKSpriteNode(imageNamed: "boardBlackStrip")
        self.blackStrip!.alpha = 0.3
        self.blackStrip!.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        self.blackStrip!.position = CGPoint(x: 0.0, y: self.size.height/1.985)
        self.addChild(blackStrip!)
        
        //--------------------------------------------------------------------------
        
        //--------------------------------------------------------------------------
        // HUD
        
        self.initHud()
        
        //--------------------------------------------------------------------------
        
        //--------------------------------------------------------------------------
        // Botão que pausa e mostra Pop-Up que tem Voltar, Continuar ou Recomeçar
        
        self.buttonPause = RTButton(imageNamed: "btnPause", actionOnTouchBegan: false, actionTime: 1.2)
        self.buttonPause!.position = CGPoint(x: self.size.width/2, y: self.size.height/1.2)
        self.buttonPause!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.buttonPause!.setRTButtonAction { () -> () in
            
            self.pauseWindow = RTPauseWindow()
            self.pauseWindow!.zPosition += 2
            self.addChild(self.pauseWindow!)
            
            GGamePaused = true
            
            GAudioManager!.playSound(RTAudioManager.SoundsEnum.Tot)
        }
        //self.buttonPause!.zPosition += 1
        self.addChild(buttonPause!)
        
        //--------------------------------------------------------------------------
        
        
        //--------------------------------------------------------------------------
        // Adiciona o tile inicial do tabuleiro e o faz o primeiro e o último tile.
        
        let tileStart = RTTileStart()
        self.addTile(tileStart)
        self.changeTilesSize()
        
        self.currentTile = tileStart
        self.lastTile = tileStart
        
        //--------------------------------------------------------------------------
        
        let colors = [SKColor.whiteColor(), SKColor.whiteColor()]
        
        //--------------------------------------------------------------------------
        // Botão de Avançar
        
        self.buttonAdvance = RTTextButton(imageNamed: "btnAdvance", actionOnTouchBegan: true, text: "CONFIRM", fontSize: 68, minimum: 8, colors: colors, actionTime: 1.2)
        self.buttonAdvance!.anchorPoint = CGPoint(x: 1.0, y: 0.0)
        self.buttonAdvance!.position = CGPoint(x: self.size.width/1.0, y: 0.0)
        
        self.buttonAdvance!.labelText?.position.x -= self.buttonAdvance!.size.width/2.6
        self.buttonAdvance!.labelText?.position.y += self.buttonAdvance!.size.height/6
        
        self.buttonAdvance!.setRTButtonAction { () -> () in
            GAudioManager!.playSound(RTAudioManager.SoundsEnum.Tot)
            self.advanceButtonAction()
            
        }
        self.addChild(buttonAdvance!)
        
        //--------------------------------------------------------------------------
        
        //--------------------------------------------------------------------------
        // Botão de Pular
        
        self.buttonSkip = RTTextButton(imageNamed: "btnSkip", actionOnTouchBegan: true, text: "SKIP", fontSize: 68, minimum: 4, colors: colors, actionTime: 1.2)
        self.buttonSkip!.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.buttonSkip!.position = CGPoint(x: 0.0, y: 0.0)
        
        self.buttonSkip!.labelText?.position.x += self.buttonAdvance!.size.width/5.2
        self.buttonSkip!.labelText?.position.y += self.buttonSkip!.size.height/6
        
        self.buttonSkip!.setRTButtonAction { () -> () in
            GAudioManager!.playSound(RTAudioManager.SoundsEnum.Tot)
            self.skipButtonAction()
            
        }
        self.addChild(buttonSkip!)
        
        //--------------------------------------------------------------------------
        
        //--------------------------------------------------------------------------
        // Label de Nome e Descrição dos Tiles.
        
        self.labelTileName = RTLabelText(text: currentTile.tileName, fontSize: fontSize + 8, minimum: 15)
        self.labelTileName?.position = CGPoint(x: self.size.width/2, y: self.size.height/1.42)
        self.addChild(labelTileName!)
        
        self.labelTileDescription = RTLabelText(text: currentTile.tileDescription, fontSize: fontSize, minimum: 20)
        self.labelTileDescription?.position = CGPoint(x: self.size.width/2, y: self.size.height/3.3)
        self.addChild(labelTileDescription!)
        
        self.updateTileInfo()
        //--------------------------------------------------------------------------
        
        //--------------------------------------------------------------------------
        // Label de Lv e valor do Lv
        
        self.labelLv = RTLabelText(text: "LV.", fontSize: 56, minimum: 2)
        self.labelLv?.position = CGPoint(x: self.size.width/2.4, y: self.size.height/11.5)
        self.addChild(labelLv!)
        self.labelLv?.introAnimation()
        
        self.labelLevelValue = RTLabelText(text: GTileManager!.getTilesLevelAsString(), fontSize: 160, minimum: 2)
        self.labelLevelValue?.position = CGPoint(x: self.size.width/1.85, y: self.size.height/7.5)
        self.addChild(labelLevelValue!)
        self.labelLevelValue?.introAnimation()
        
        //--------------------------------------------------------------------------
        
        
        //--------------------------------------------------------------------------
        // Adiciona gráfico do heroi no mapa
        
        heroDisplay = RTSelectable(imageNamed: GHeroesManager!.currentHero.imageName)
        self.heroDisplay?.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.heroDisplay?.runAction(SKAction.scaleXTo(-0.75, y: 0.75, duration: 0.0))
        self.heroDisplay?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.heroDisplay?.userInteractionEnabled = false
        self.heroDisplay?.zPosition += 1
        self.addChild(heroDisplay!)
        
        //--------------------------------------------------------------------------
        
        self.userInteractionEnabled = true
        
    }

    
    // Deixa o tile atual usado e chama o update do tabuleiro.
    func setCurrentTileUsed(){
        
        // Caso o tile atual for tambem o ultimo, chama a janela de escolha de pack
        if self.currentTile == self.lastTile{
            
            let blockUsed = SKAction.runBlock({self.currentTile.setTileUsed()})
            
            let block = SKAction.runBlock({
                // CHAMA JANELA DE PACK
                let tileWindow = RTTileWindow()
                tileWindow.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
                self.addChild(tileWindow)
                
            })
            
            
            let wait = SKAction.waitForDuration(0.6)
            
            let sequence = SKAction.sequence([blockUsed, wait, block])
            self.runAction(sequence)
            
            return // Sai do metodo para não ter que realizar animação / atualização do tabuleiro
        }
        
        // Animação de tile sendo usado e tabuleiro sendo atualizado.
        
        let blockTileUsed = SKAction.runBlock({self.currentTile.setTileUsed()})
        let blockTileUpdate = SKAction.runBlock({self.updateBoard()})
        
        let wait = SKAction.waitForDuration(0.2)
        
        let sequence = SKAction.sequence([blockTileUsed, wait, blockTileUpdate])
        
        self.runAction(sequence)
    }
    
    // Adiciona um pack de tiles ao tabuleiro e os posiciona na tela andando pra direita (Recuando).
    func setPackPicked(tileType: RTTile.TileType){
        
        let newPath = GTileManager!.pickTileSet(tileType)
        var posX, sizeX: CGFloat
        
        for (index, tile) in enumerate(newPath){
            self.addTile(tile)
            
            posX = tile.position.x
            sizeX = tileMargin
            
            tile.moveTileToPosition(posX + (sizeX * CGFloat(index + 1)) + sizeX/2)
            self.lastTile = tile // Faz com que o último do loop tome a posição de último do tabuleiro
        }
        
        let blockTileSize = SKAction.runBlock({
            self.changeTilesSize()
            
            // Muda o nivel dos tiles
            self.labelLevelValue?.setLabelText(GTileManager!.getTilesLevelAsString())
            self.labelLevelValue?.introAnimation()
        })
        let blockTileUpdate = SKAction.runBlock({self.updateBoard()})
        
        let wait = SKAction.waitForDuration(0.5)
        
        let sequence = SKAction.sequence([blockTileSize, wait, blockTileUpdate])
        
        
        self.runAction(sequence)
        
    }
    
    // Atualiza as labels com informação dos tiles
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
    
    // Ação do botão de avançar
    private func advanceButtonAction(){
        if !currentTile.tileUsed{
            //  CHAMA EVENTO DO TILE ATUAL
            currentTile.tileEvent()
            
        }
        else if currentTile != lastTile{ // Está usado e não é o último
            self.updateBoard()
            
        }

    }
    
    // Ação do botão de pular
    private func skipButtonAction(){
        if !currentTile.tileUsed{
            self.setCurrentTileUsed()
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
            sizeX = tileMargin
            
            if index == boardPathIndex || index == boardPathIndex-1{
                sizeX = tileMargin + tileMargin/2
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
