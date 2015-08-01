//
//  RTHeroSelectionScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class RTHeroSelectionScene: SKScene {
    
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
        
        addChild(roupa1)
        
        addChild(roupa2)
        
        addChild(roupa3)
        
        addChild(roupa4)
        
        addChild(roupa5)
        
        addChild(roupa6)
        
        roupasArray = [roupa1, roupa2, roupa3, roupa4, roupa5, roupa6]
        hpStarArray = [hpStar1, hpStar2, hpStar3, hpStar4, hpStar5]
        ganStarArray = [ganStar1, ganStar2, ganStar3, ganStar4, ganStar5]
        mainStarArray = [mainStar1, mainStar2, mainStar3, mainStar4, mainStar5]
        agiStarArray = [agiStar1, agiStar2, agiStar3, agiStar4, agiStar5]
        staStarArray = [staStar1, staStar2, staStar3, staStar4, staStar5]
        
        let roupaCrescer : SKAction = SKAction.scaleTo(2.0, duration: 0.5)
        
        textNome = SKLabelNode(text: roupa3.name!)
        textDescricao = SKLabelNode(text:roupa3.information)
        
        textNome.position = CGPointMake(meio, frame.maxY - 50)
        textDescricao.position = CGPointMake(meio + 100, meioY - 100)
        addChild(textNome)
        addChild(textDescricao)
        
        posFinais()
        starsPos()
        stars()
        
        agiLabel.fontSize = 25
        hpLabel.fontSize = 25
        ganLabel.fontSize = 25
        staLabel.fontSize = 25
        
        var botY = frame.minY
        
        hpLabel.position = CGPoint(x: 50, y: botY + 200)
        ganLabel.position = CGPoint(x: 50, y: botY + 150)
        agiLabel.position = CGPoint(x: 50, y: botY + 100)
        staLabel.position = CGPoint(x: 50, y: botY + 50)
        
        mainLabel.text = roupasArray[pos].properties.primaryType
        mainLabel.fontSize = 25
        mainLabel.position = CGPoint(x : 50, y: botY + 250)
        
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
        
        let moverOut : SKAction = SKAction.moveByX(100, y: 0.0, duration: 0.5)
        let roupaDiminuir : SKAction = SKAction.scaleTo(1, duration: 0.5)
        
        let moverSaida : SKAction = SKAction.moveByX(-50, y: 0.0, duration: 0.5)
        let roupaEntrada : SKAction = SKAction.scaleBy(1.5, duration: 0.5)
        
        let moverEntrada : SKAction = SKAction.moveByX(-50, y: 0.0, duration: 0.5)
        let roupaSaida : SKAction = SKAction.scaleBy(0.65, duration: 0.5)
        
        // Para esquerda
        
        let moverInE : SKAction = SKAction.moveByX(-100, y: 0.0 , duration: 0.5)
        
        let moverOutE : SKAction = SKAction.moveByX(-100, y: 0.0, duration: 0.5)
        
        let moverSaidaE : SKAction = SKAction.moveByX(50, y: 0.0, duration: 0.5)
        
        let moverEntradaE : SKAction = SKAction.moveByX(50, y: 0.0, duration: 0.5)
        
        let url = NSURL(fileURLWithPath:
            NSBundle.mainBundle().pathForResource("Troca",
                ofType: "wav")!)
        
        var error: NSError?
        
        AVAudioPlayer(contentsOfURL: url, error: &error)
        
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
    }
    
    func posFinais(){
        var spriteMeio = meioY + 50
        var spriteY = frame.maxY - 150
        
        roupasArray[posEntrada].zPosition = 0
        roupasArray[posEntrada].position = CGPoint(x: meio - 50, y: spriteY)
        roupasArray[posEntrada].size = CGSize(width: 50, height: 50)
        roupasArray[posEntrada].hidden = false
        
        roupasArray[posSaida].zPosition = 0
        roupasArray[posSaida].position = CGPoint(x: meio + 50, y: spriteY)
        roupasArray[posSaida].size = CGSize(width: 50, height: 50)
        roupasArray[posSaida].hidden = false
        
        roupasArray[posAnterior].zPosition = 1
        roupasArray[posAnterior].position = CGPoint(x: meio - 100, y: spriteY)
        roupasArray[posAnterior].size = CGSize(width: 75, height: 75)
        roupasArray[posAnterior].hidden = false
        
        roupasArray[posPosterior].zPosition = 1
        roupasArray[posPosterior].position = CGPoint(x: meio + 100, y: spriteY)
        roupasArray[posPosterior].size = CGSize(width: 75, height: 75)
        roupasArray[posPosterior].hidden = false
        
        roupasArray[pos].position = CGPoint(x: meio, y: spriteY)
        roupasArray[pos].size = CGSize(width: 150, height: 150)
        roupasArray[pos].hidden = false
        roupasArray[pos].zPosition = 2
    }
    
    func starsPos(){
        var cont = 0
        var botY = frame.minY
        
        while(cont < 5){
            hpStarArray[cont].position = CGPoint(x: 150, y: botY + 210)
            hpStarArray[cont].size = CGSize(width: 30, height: 30)
            cont++
        }
        
        cont = 0
        while(cont < 5){
            mainStarArray[cont].position = CGPoint(x: 150, y: 260)
            mainStarArray[cont].size = CGSize(width: 30, height: 30)
            cont++
        }
        
        cont = 0
        while(cont < 5){
            ganStarArray[cont].position = CGPoint(x: 150, y: 160)
            ganStarArray[cont].size = CGSize(width: 30, height: 30)
            cont++
        }
        
        cont = 0
        while(cont < 5){
            agiStarArray[cont].position = CGPoint(x: 150, y: 110)
            agiStarArray[cont].size = CGSize(width: 30, height: 30)
            cont++
        }
        
        cont = 0
        while(cont < 5){
            staStarArray[cont].position = CGPoint(x: 150, y: 60)
            staStarArray[cont].size = CGSize(width: 30, height: 30)
            cont++
        }
    }
    
    func stars(){
        var cont : Int = 1
        var xCont : CGFloat = 30
        
        while(cont < roupasArray[pos].properties.primary) {
            mainStarArray[cont].runAction(SKAction.moveByX(xCont, y: 0, duration: 0.1))
            cont++
            xCont += 30
        }
        cont = 1
        xCont = 30
        
        while(cont < roupasArray[pos].properties.health) {
            hpStarArray[cont].runAction(SKAction.moveByX(xCont, y: 0, duration: 0.1))
            cont++
            xCont += 30
        }
        cont = 1
        xCont = 30
        
        while(cont < roupasArray[pos].properties.greed) {
            ganStarArray[cont].runAction(SKAction.moveByX(xCont, y: 0, duration: 0.1))
            cont++
            xCont += 30
        }
        cont = 1
        xCont = 30
        
        while(cont < roupasArray[pos].properties.agility) {
            agiStarArray[cont].runAction(SKAction.moveByX(xCont, y: 0, duration: 0.1))
            cont++
            xCont += 30
        }
        cont = 1
        xCont = 30
        
        while(cont < roupasArray[pos].properties.stamina) {
            staStarArray[cont].runAction(SKAction.moveByX(xCont, y: 0, duration: 0.1))
            cont++
            xCont += 30
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        
    }
}
