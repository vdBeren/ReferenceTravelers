//
//  RTStageSelectionScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit
<<<<<<< HEAD
import AVFoundation

class RTStageSelectionScene: SKScene {
    
    var buttonLeft = RTButton(imageNamed: "btnArrowEsq")
    var buttonRight = RTButton(imageNamed: "btnArrowDir")
    var stagesArray : [RTStage]!
    var posAnterior : Int = 0
    var posPosterior : Int = 2
    var pos : Int = 1
    var liberar = true
    var audioPlayer = AVAudioPlayer()
    var nameLabel = SKLabelNode(text: "")
    var infoLabel = SKLabelNode(text: "")
    var diffLabel = SKLabelNode(text: "")
=======

// Classe da cena de Fases. Possui um Selection Menu e uma Text Window.

class RTStageSelectionScene: SKScene {
    
    var btnBack: RTBoingButton?
    var backgroundNode: RTBackground?
    var selectionMenu: RTSelectionMenu?
    var textWindow: RTStageTextWindow?
>>>>>>> master
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        var meio = scene?.frame.midX
        var meioY = frame.midY
        
        var stageEpic = RTStage(imageNamed: "bg1")
        stageEpic.name = "Medieval"
        stageEpic.information = "Espadas, escudos, mortes e traições"
        stageEpic.difficulty = "Easy"
        
        var stageSpace = RTStage(imageNamed: "bg2")
        stageSpace.name = "Space"
        stageSpace.information = "Aquela fase com espadas luminosas e vilões asmáticos"
        stageSpace.difficulty = "Hard"
        
        var stageFF = RTStage(imageNamed: "bg0")
        stageFF.name = "Last Fantasy"
        stageFF.information = "Malditos ninjas cortando cebola"
        stageFF.difficulty = "Epic"
        
        stagesArray = [stageEpic, stageSpace, stageFF]
        
        addChild(stageEpic)
        addChild(stageSpace)
        addChild(stageFF)
        
        //Background da Scene
<<<<<<< HEAD
        backgroundColor = SKColor(red: 256.0, green: 0.0, blue: 0.0, alpha: 1.0)

        buttonLeft.position = CGPoint(x: meio! - 450 , y: frame.midY - 100)
        buttonLeft.alpha = 0.3
        buttonLeft.size.height = 400
        buttonLeft.size.width = 70
        buttonLeft.zPosition = 5
        
        buttonRight.position = CGPoint(x: meio! + 100 , y: frame.midY - 100)
        buttonRight.alpha = 0.3
        buttonRight.size.height = 400
        buttonRight.size.width = 70
        buttonRight.zPosition = 5
        
        //BLOCO DE AÇÃO DO BOTÃO
        buttonLeft.setRTButtonAction({ () -> () in
            self.buttonPress(true)
        })
        self.addChild(buttonLeft)
        
        buttonRight.setRTButtonAction({ () -> () in
            self.buttonPress(false)
        })
        self.addChild(buttonRight)
        
        posFinais()
        
        nameLabel = SKLabelNode(text: stagesArray[pos].name!)
        infoLabel = SKLabelNode(text: stagesArray[pos].information)
        diffLabel = SKLabelNode(text: stagesArray[pos].difficulty)
        
        infoLabel.position = CGPoint(x: frame.minX + 50, y: meioY - 200)
        infoLabel.fontColor = SKColor(red: 0, green: 0, blue: 256, alpha: 1)
        infoLabel.fontSize = 40
        infoLabel.horizontalAlignmentMode = .Left
        
        nameLabel.position = CGPoint(x: frame.minX + 50, y: meioY - 150)
        nameLabel.fontColor = SKColor(red: 0, green: 0, blue: 256, alpha: 1)
        nameLabel.fontSize = 40
        nameLabel.horizontalAlignmentMode = .Left
        
        diffLabel.position = CGPoint(x: frame.maxX - 150, y: meioY - 150)
        diffLabel.fontColor = SKColor(red: 0, green: 0, blue: 256, alpha: 1)
        diffLabel.fontSize = 40
        diffLabel.horizontalAlignmentMode = .Left
        
        addChild(infoLabel)
        addChild(nameLabel)
        addChild(diffLabel)
    }
    
    func buttonPress(lado: Bool) {
        
        let moverDireita : SKAction = SKAction.moveByX(620, y: 0.0 , duration: 0.5)
        
        let moverEsquerda : SKAction = SKAction.moveByX(-620, y: 0.0 , duration: 0.5)
        
        let url = NSURL(fileURLWithPath:
            NSBundle.mainBundle().pathForResource("Troca",
                ofType: "wav")!)
        
        var error: NSError?
        
        AVAudioPlayer(contentsOfURL: url, error: &error)
        
        if(liberar){
            liberar = false
            
            var spriteMeio = frame.midX + 50
            var spriteY = frame.midY + 100
            
            if(lado == true){
                stagesArray[posAnterior].runAction(moverDireita)
                stagesArray[posPosterior].position = CGPoint(x: spriteMeio - 810, y: spriteY)
                stagesArray[pos].runAction(moverDireita, completion: ({
                    //self.posFinais()
                    self.liberar = true
                }))
                
                posAnterior--
                pos--
                posPosterior--
                
            }
            else if(lado == false) {
                stagesArray[posPosterior].runAction(moverEsquerda)
                stagesArray[posAnterior].position = CGPoint(x: spriteMeio + 430, y: spriteY)
                stagesArray[pos].runAction(moverEsquerda, completion: ({
                    //self.posFinais()
                    self.liberar = true
                }))
                
                posAnterior++
                pos++
                posPosterior++
            }
            
            if(posAnterior == -1){
                posAnterior = stagesArray.count - 1
            }
            else if(posAnterior == stagesArray.count){
                posAnterior = 0
            }
            
            if(pos == -1){
                pos = stagesArray.count - 1
            }
            else if(pos == stagesArray.count){
                pos = 0
            }
            
            if(posPosterior == -1){
                posPosterior = stagesArray.count - 1
            }
            else if(posPosterior == stagesArray.count){
                posPosterior = 0
            }
            
            nameLabel.text = stagesArray[pos].name!
            infoLabel.text = stagesArray[pos].information
            diffLabel.text = stagesArray[pos].difficulty
            
            audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
            audioPlayer.volume = 0.2
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
    }
    
    func posFinais(){
        var spriteMeio = frame.midX + 50
        var spriteY = frame.midY + 100

        stagesArray[posAnterior].position = CGPoint(x: spriteMeio - 810, y: spriteY)
        stagesArray[posAnterior].size = CGSize(width: 620, height: 400)
        stagesArray[posAnterior].hidden = false
        
        stagesArray[posPosterior].position = CGPoint(x: spriteMeio + 430, y: spriteY)
        stagesArray[posPosterior].size = CGSize(width: 620, height: 400)
        stagesArray[posPosterior].hidden = false
        
        stagesArray[pos].position = CGPoint(x: spriteMeio - 190, y: spriteY)
        stagesArray[pos].size = CGSize(width: 620, height: 400)
        stagesArray[pos].hidden = false
        
=======
        backgroundNode = RTBackground(imageNamed: "bgStageSelection")
        backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        self.addChild(backgroundNode!)

        
        // Selection Menu
        
        let arrayImageNames = ["btnSelectionLeft", "btnSelectionRight", "hologramLight", "barText"]
        let arrayText = ["RESEARCH", "TRAVEL!"]
        let colors = [SKColor.whiteColor(), SKColor.clearColor()]
        
        selectionMenu = RTSelectionMenu(objectArray: GStageManager!.stageArray, buttonsImageNames: arrayImageNames, selectButtonTexts: arrayText, colors: colors)
        self.buildSelectionMenu()
        self.addChild(selectionMenu!)
        
        // Text Window
        textWindow = RTStageTextWindow()
        textWindow?.zPosition += 1
        self.addChild(textWindow!)
        
        btnBack = RTBoingButton(imageNamed: "btnBack", actionOnTouchBegan: true, actionTime: 1.0)
        self.btnBack!.position = CGPoint(x: self.size.width/22, y: self.size.height/1.08)
        self.btnBack!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        btnBack?.zPosition += 1
        
        //BLOCO DE AÇÃO DO BOTÃO
        btnBack?.setRTButtonAction({ () -> () in
            let block = SKAction.runBlock({
                GHeroSelectionScene!.returningFromStage()
                let transition = SKTransition.pushWithDirection(SKTransitionDirection.Down, duration: 1.5)
                self.scene?.view?.presentScene(GHeroSelectionScene, transition: transition)
            })
            
            let wait = SKAction.waitForDuration(0.3)
            let sequence = SKAction.sequence([wait, block])
            
            self.runAction(sequence)

        })
        self.addChild(btnBack!)
        
        
    }
    
    private func buildSelectionMenu(){
        
        selectionMenu?.setRTChangeSelectionAction({ () -> () in
            let selectionIndex: Int = self.selectionMenu!.selectionIndex
            let selectionStage: RTSelectable = self.selectionMenu!.objectArray[selectionIndex]
            
            // Atualiza a fase atual.
            GStageManager!.currentStage = (selectionStage as? RTStage)!
            self.textWindow!.refreshContents()
            
        })
        
        selectionMenu?.setRTSelectButton({ () -> () in
            GAudioManager?.playMusic(RTAudioManager.MusicsEnum.Board)
            self.runAction(SKAction.waitForDuration(0.2))
            let transition = SKTransition.crossFadeWithDuration(1.2)
            //let transition = SKTransition.pushWithDirection(SKTransitionDirection.Down, duration: 1.5)
            
            GBoardScene!.initBoard()
            self.scene?.view?.presentScene(GBoardScene, transition: transition)
        })
>>>>>>> master
        
        var sizeW = self.size.width
        var sizeH = self.size.height
        
        selectionMenu!.btnLeft?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnLeft!.position = CGPoint(x: sizeW/6.5, y: sizeH/1.5)
        
        selectionMenu!.btnRight?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnRight!.position = CGPoint(x: sizeW/1.61, y: sizeH/1.5)
        
        selectionMenu!.btnSelect?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnSelect?.position = CGPoint(x: sizeW/1.18, y: sizeH/1.7)
        selectionMenu!.btnSelect?.labelText?.fontSize = 45.0
        selectionMenu!.btnSelect?.labelText?.position.y += 40
        selectionMenu!.btnSelect?.zPosition += 1
        selectionMenu!.btnSelect?.userInteractionEnabled = true
        
        // TEMP: base do botão de holograma
        let hologramPad = SKSpriteNode(imageNamed: "hologramPad")
        hologramPad.position.y -= 300
        selectionMenu!.btnSelect?.addChild(hologramPad)
        
        selectionMenu!.selectableDisplay?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.selectableDisplay?.position = CGPoint(x: sizeW/2.613, y: sizeH/1.507)
        
        selectionMenu!.labelObjectName?.hidden = true
        selectionMenu!.labelObjectName?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.labelObjectName?.position = CGPoint(x: sizeW/2, y: sizeH/1.3)

    }
    
    //Chamado a todo frame. Usado para realizar o update dos nodes da Scene, em cascata.
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
    }
    
    
    //Recebe toques na Scene.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
