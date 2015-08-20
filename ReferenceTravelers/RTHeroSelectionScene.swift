//
//  RTHeroSelectionScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


// Classe da cena de seleção de Heroi. Possui um Selection Menu e uma Text Window.

class RTHeroSelectionScene: SKScene {
    
<<<<<<< HEAD
    let agiLabel : SKLabelNode = SKLabelNode(text: "AGI")
    var mainLabel : SKLabelNode = SKLabelNode(text: "X")
    let hpLabel : SKLabelNode = SKLabelNode(text: "HP")
    let staLabel : SKLabelNode = SKLabelNode(text: "STA")
    let sorLabel : SKLabelNode = SKLabelNode(text: "SOR")
    let ganLabel : SKLabelNode = SKLabelNode(text: "GAN")
    var roupasArray : [RTHero]!
    var hpStarArray : [SKSpriteNode]!
    var ganStarArray : [SKSpriteNode]!
    var mainStarArray : [SKSpriteNode]!
    var agiStarArray : [SKSpriteNode]!
    var staStarArray : [SKSpriteNode]!
    var posAnterior : Int = 1
    var posPosterior : Int = 3
    var pos : Int = 2
    var posSaida : Int = 4
    var posEntrada : Int = 0
    var liberar : Bool = true
    var textDescricao : SKLabelNode!
    var textNome : SKLabelNode!
    var meio : CGFloat!
    var meioY : CGFloat!
    var audioPlayer = AVAudioPlayer()
    let buttonLeft = RTButton(imageNamed: "btnArrowEsq")
    let buttonRight = RTButton(imageNamed: "btnArrowDir")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        meio = CGRectGetMidX(frame)
        meioY = CGRectGetMidY(frame)
        
        backgroundColor = SKColor(red: 256.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
        let hpStar1 = SKSpriteNode(imageNamed: "Star")
        addChild(hpStar1)
        let hpStar2 = SKSpriteNode(imageNamed: "Star")
        addChild(hpStar2)
        let hpStar3 = SKSpriteNode(imageNamed: "Star")
        addChild(hpStar3)
        let hpStar4 = SKSpriteNode(imageNamed: "Star")
        addChild(hpStar4)
        let hpStar5 = SKSpriteNode(imageNamed: "Star")
        addChild(hpStar5)
        
        let ganStar1 = SKSpriteNode(imageNamed: "Star")
        addChild(ganStar1)
        let ganStar2 = SKSpriteNode(imageNamed: "Star")
        addChild(ganStar2)
        let ganStar3 = SKSpriteNode(imageNamed: "Star")
        addChild(ganStar3)
        let ganStar4 = SKSpriteNode(imageNamed: "Star")
        addChild(ganStar4)
        let ganStar5 = SKSpriteNode(imageNamed: "Star")
        addChild(ganStar5)
        
        let mainStar1 = SKSpriteNode(imageNamed: "Star")
        addChild(mainStar1)
        let mainStar2 = SKSpriteNode(imageNamed: "Star")
        addChild(mainStar2)
        let mainStar3 = SKSpriteNode(imageNamed: "Star")
        addChild(mainStar3)
        let mainStar4 = SKSpriteNode(imageNamed: "Star")
        addChild(mainStar4)
        let mainStar5 = SKSpriteNode(imageNamed: "Star")
        addChild(mainStar5)
        
        let agiStar1 = SKSpriteNode(imageNamed: "Star")
        addChild(agiStar1)
        let agiStar2 = SKSpriteNode(imageNamed: "Star")
        addChild(agiStar2)
        let agiStar3 = SKSpriteNode(imageNamed: "Star")
        addChild(agiStar3)
        let agiStar4 = SKSpriteNode(imageNamed: "Star")
        addChild(agiStar4)
        let agiStar5 = SKSpriteNode(imageNamed: "Star")
        addChild(agiStar5)
        
        let staStar1 = SKSpriteNode(imageNamed: "Star")
        addChild(staStar1)
        let staStar2 = SKSpriteNode(imageNamed: "Star")
        addChild(staStar2)
        let staStar3 = SKSpriteNode(imageNamed: "Star")
        addChild(staStar3)
        let staStar4 = SKSpriteNode(imageNamed: "Star")
        addChild(staStar4)
        let staStar5 = SKSpriteNode(imageNamed: "Star")
        addChild(staStar5)
        
        var roupa1 = RTHero(imageNamed: "Spaceship")
        roupa1.physicsBody?.dynamic = false
        roupa1.properties.primary = 4
        roupa1.properties.health = 2
        roupa1.properties.greed = 2
        roupa1.properties.agility = 4
        roupa1.properties.stamina = 3
        roupa1.properties.primaryType = "INT"
        roupa1.name = "Nave"
        roupa1.information = "X"
        
        var roupa2 = RTHero(imageNamed: "PowerUp")
        roupa2.physicsBody?.dynamic = false
        roupa2.properties.primary = 5
        roupa2.properties.health = 2
        roupa2.properties.greed = 2
        roupa2.properties.agility = 1
        roupa2.properties.stamina = 1
        roupa2.properties.primaryType = "FOR"
        roupa2.name = "Bola"
        roupa2.information = "Y"
        
        var roupa3 = RTHero(imageNamed: "Player")
        roupa3.physicsBody?.dynamic = false
        roupa3.properties.primary = 4
        roupa3.properties.health = 3
        roupa3.properties.greed = 3
        roupa3.properties.agility = 2
        roupa3.properties.stamina = 5
        roupa3.properties.primaryType = "INT"
        roupa3.name = "Robô"
        roupa3.information = "Z"
        
        var roupa4 = RTHero(imageNamed: "s")
        roupa4.physicsBody?.dynamic = false
        roupa4.properties.primary = 4
        roupa4.properties.health = 1
        roupa4.properties.greed = 1
        roupa4.properties.agility = 3
        roupa4.properties.stamina = 3
        roupa4.properties.primaryType = "DES"
        roupa4.name = "Pikachu"
        roupa4.information = "A"
        
        var roupa5 = RTHero(imageNamed: "Charmander")
        roupa5.physicsBody?.dynamic = false
        roupa5.properties.primary = 3
        roupa5.properties.health = 3
        roupa5.properties.greed = 2
        roupa5.properties.agility = 3
        roupa5.properties.stamina = 4
        roupa5.properties.primaryType = "FOR"
        roupa5.name = "Charmander"
        roupa5.information = "B"
        
        var roupa6 = RTHero(imageNamed: "Meowth")
        roupa6.physicsBody?.dynamic = false
        roupa6.properties.primary = 5
        roupa6.properties.health = 1
        roupa6.properties.greed = 5
        roupa6.properties.agility = 3
        roupa6.properties.stamina = 1
        roupa6.properties.primaryType = "DES"
        roupa6.name = "Meowth"
        roupa6.information = "C"
=======
    var backgroundNode: RTBackground?
    var selectionMenu: RTSelectionMenu?
    var textWindow: RTHeroTextWindow?
    
    override init(size: CGSize) {
>>>>>>> master
        
        super.init(size: size)
        
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bgHeroSelection")
        backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        self.addChild(backgroundNode!)
        
        // Text Window
        textWindow = RTHeroTextWindow()
        self.addChild(textWindow!)
        
        // Selection Menu
        let arrayImageNames = ["btnSelectionLeft", "btnSelectionRight", "btnText", "barText"]
        let arrayText = ["HIRE", "CHOOSE"]
        let colors = [SKColor.orangeColor(), SKColor.whiteColor()]
        
        selectionMenu = RTSelectionMenu(objectArray: GHeroesManager!.heroArray, buttonsImageNames: arrayImageNames, selectButtonTexts: arrayText, colors: colors)
        self.buildSelectionMenu()
        self.addChild(selectionMenu!)
        
        self.userInteractionEnabled = false

    }
    
    func restoreScene(){
        
        let alpha = SKAction.fadeAlphaTo(1.0, duration: 0.8)
        
        let blockHidden = SKAction.runBlock({
            self.textWindow?.runAction(alpha)
            self.selectionMenu?.runAction(alpha)
            self.selectionMenu?.userInteractionEnabled = true
        })
        
        self.runAction(blockHidden)
        
    }
    
    func returningFromStage(){
        
        let zoom = SKAction.scaleTo(1.0, duration: 1.0)
        let move = SKAction.moveByX(880, y: 630, duration: 1.0)
        let group = SKAction.group([zoom, move])
        
        let block = SKAction.runBlock({self.restoreScene()})
        let sequence = SKAction.sequence([group, block])
        
<<<<<<< HEAD
        addChild(hpLabel)
        addChild(mainLabel)
        addChild(ganLabel)
        addChild(agiLabel)
        addChild(staLabel)
        
        buttonLeft.position = CGPoint(x: meio - 210 , y: frame.maxY - 250)
        buttonLeft.alpha = 0.3
        buttonLeft.size.height = 200
        buttonLeft.size.width = 60
        
        buttonRight.position = CGPoint(x: meio + 150 , y: frame.maxY - 250)
        buttonRight.alpha = 0.3
        buttonRight.size.height = 200
        buttonRight.size.width = 60
        
        buttonLeft.setRTButtonAction({ () -> () in
            self.buttonPress(false)
        })
        self.addChild(buttonLeft)
        
        buttonRight.setRTButtonAction({ () -> () in
            self.buttonPress(true)
        })
        self.addChild(buttonRight)
    }
    
    func buttonPress(lado: Bool) {
        let fadeIn : SKAction = SKAction.fadeInWithDuration(0.5)
        let fadeOut : SKAction = SKAction.fadeOutWithDuration(0.5)
        
        let moverIn : SKAction = SKAction.moveByX(100, y: 0.0 , duration: 0.5)
        let roupaCrescer : SKAction = SKAction.scaleTo(2, duration: 0.5)
=======
        self.backgroundNode!.runAction(sequence)
    }
    
    // Constroi o menu de seleção
    private func buildSelectionMenu(){
>>>>>>> master
        
        
        selectionMenu?.setRTChangeSelectionAction({ () -> () in
            let selectionIndex: Int = self.selectionMenu!.selectionIndex
            let selectionHero: RTSelectable = self.selectionMenu!.objectArray[selectionIndex]
            
            GHeroesManager!.currentHero = (selectionHero as? RTHero)!
            self.textWindow!.refreshContents()
            
            GAudioManager!.playSound(RTAudioManager.SoundsEnum.Blop)
            
        })
        
        selectionMenu?.setRTSelectButton({ () -> () in
            
            let alpha = SKAction.fadeAlphaTo(0.0, duration: 0.4)
            
            self.selectionMenu?.userInteractionEnabled = false

            
            let blockHidden = SKAction.runBlock({
                self.textWindow?.runAction(alpha)
                self.selectionMenu?.runAction(alpha)
            })
            
            let wait = SKAction.waitForDuration(0.8)
            
            let sequenceHidden = SKAction.sequence([blockHidden, wait])
            
            self.runAction(sequenceHidden)
            
            
            let zoom = SKAction.scaleTo(2.5, duration: 1.0)
            let move = SKAction.moveByX(-880, y: -630, duration: 1.0)
            let group = SKAction.group([zoom, move])
            
            let block = SKAction.runBlock({
                
                let transition = SKTransition.pushWithDirection(SKTransitionDirection.Up, duration: 1.5)
                self.scene?.view?.presentScene(GStageSelectionScene, transition: transition)
            })
            
            let sequence = SKAction.sequence([group, block])
            
            self.backgroundNode!.runAction(sequence)

        })
        
        var sizeW = self.size.width
        var sizeH = self.size.height
        
        selectionMenu!.btnLeft?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnLeft!.position = CGPoint(x: sizeW/3.1, y: sizeH/1.7)
        
        selectionMenu!.btnRight?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnRight!.position = CGPoint(x: sizeW/1.45, y: sizeH/1.7)
        
        selectionMenu!.btnSelect?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.btnSelect!.position = CGPoint(x: sizeW/2, y: sizeH/2.6)
        
        selectionMenu!.selectableDisplay?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.selectableDisplay?.position = CGPoint(x: sizeW/2, y: sizeH/1.75)
        
        
        selectionMenu!.labelObjectName?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        selectionMenu!.labelObjectName?.position = CGPoint(x: sizeW/2, y: sizeH/1.3)
        
        
<<<<<<< HEAD
        if(liberar){
            liberar = false
            starsPos()
        
            if(lado == true){
                roupasArray[posEntrada].runAction(moverEntrada)
                roupasArray[posEntrada].runAction(roupaEntrada)
                roupasArray[posEntrada].runAction(fadeIn)
                roupasArray[posAnterior].zPosition = 2
                roupasArray[posAnterior].runAction(moverIn)
                roupasArray[posAnterior].runAction(roupaCrescer)
                roupasArray[posPosterior].zPosition = 0
                roupasArray[posPosterior].runAction(moverSaida)
                roupasArray[posPosterior].runAction(roupaSaida)
                roupasArray[posPosterior].runAction(fadeOut)
                roupasArray[posSaida].hidden = true
                roupasArray[pos].zPosition = 1
                roupasArray[pos].runAction(moverOut, completion: ({
                    self.posFinais()
                    self.liberar = true
                }))
                roupasArray[pos].runAction(roupaDiminuir)
                
                posEntrada--
                posAnterior--
                pos--
                posPosterior--
                posSaida--
            
            }
            else if(lado == false) {
                roupasArray[posSaida].runAction(moverEntradaE)
                roupasArray[posSaida].runAction(roupaEntrada)
                roupasArray[posSaida].runAction(fadeIn)
                roupasArray[posAnterior].zPosition = 0
                roupasArray[posAnterior].runAction(moverSaidaE)
                roupasArray[posAnterior].runAction(roupaSaida)
                roupasArray[posAnterior].runAction(fadeOut)
                roupasArray[posPosterior].zPosition = 2
                roupasArray[posPosterior].runAction(moverInE)
                roupasArray[posPosterior].runAction(roupaCrescer)
                roupasArray[posEntrada].hidden = true
                roupasArray[pos].zPosition = 1
                roupasArray[pos].runAction(moverOutE, completion: ({
                    self.posFinais()
                    self.liberar = true
                }))
                roupasArray[pos].runAction(roupaDiminuir)
                
                posEntrada++
                posAnterior++
                pos++
                posPosterior++
                posSaida++
            }
            
            
            
            if(posEntrada == -1){
                posEntrada = roupasArray.count - 1
            }
            else if(posEntrada == roupasArray.count){
                posEntrada = 0
            }
            
            if(posAnterior == -1){
                posAnterior = roupasArray.count - 1
            }
            else if(posAnterior == roupasArray.count){
                posAnterior = 0
            }
            
            if(pos == -1){
                pos = roupasArray.count - 1
            }
            else if(pos == roupasArray.count){
                pos = 0
            }
            
            if(posPosterior == -1){
                posPosterior = roupasArray.count - 1
            }
            else if(posPosterior == roupasArray.count){
                posPosterior = 0
            }
            
            if(posSaida == -1){
                posSaida = roupasArray.count - 1
            }
            else if(posSaida == roupasArray.count){
                posSaida = 0
            }
            
            textNome.text = roupasArray[pos].name!
            textDescricao.text = roupasArray[pos].information
            
            audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
            audioPlayer.volume = 0.2
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            stars()
            mainLabel.text = roupasArray[pos].properties.primaryType
        }
=======
>>>>>>> master
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
