//
//  RTCombatScene.swift
//  ReferenceTravelers
//
//  Created by Bruno Munhoz on 02/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


class RTCombatScene: SKScene, SKPhysicsContactDelegate{
    
    var background: RTBackground?
    
    var combatHud: RTHud?
    
    var player : RTHero = RTHero(imageNamed: "personagem")
    var parentNode : SKSpriteNode = SKSpriteNode(imageNamed: "")
    var lado : Int = 1
    var colisao : Int = 0
    var chao = SKSpriteNode(imageNamed: "chao")
    
    // TODO: Gamepad
    //var gamePad = RTGamePad?
    
    var btnDir = RTButton(imageNamed: "btnCombatDir", actionOnTouchBegan: true, actionTime: 0.2)
    var btnEsq = RTButton(imageNamed: "btnCombatEsq", actionOnTouchBegan: true, actionTime: 0.2)
    var btnPulo = RTButton(imageNamed: "btnJump", actionOnTouchBegan: true, actionTime: 0.2)
    
    var buttonPause: RTButton?
    var pauseWindow: RTPauseWindow?
    
    var velocityY : Int = 400
    var jump : Bool = false
    var sword = SKSpriteNode(imageNamed: "bgMedieval")
    var btnPress : Bool = false
    var joint : SKPhysicsJointFixed?
    var pulo : Bool = false
    var voltar : Bool = false
    var ladoDir = SKSpriteNode(imageNamed: "")
    var ladoEsq = SKSpriteNode(imageNamed: "")
    var mobCount = 0
    var mobDeathCount = 0
    var mobDeathLabel : SKLabelNode = SKLabelNode(text: String(0))
    var bossBattle = false
    var invulnerabilty : Bool = false
    
    
    let fireballBitMask : UInt32 = 0x1 << 7
    let parentBitMask : UInt32 = 0x1 << 6
    let floorBitMask : UInt32 = 0x1 << 5
    let edgesBitMask : UInt32 = 0x1 << 4
    let weaponBitMask : UInt32 = 0x1 << 3
    let mobsBitMask : UInt32 = 0x1 << 2
    let heroBitMask : UInt32 = 0x1 << 1
    let nullBitMask : UInt32 = 0x1 << 0
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        self.initCombat()

    }
    
    override func didFinishUpdate() {
        
    }
    
    func initHud(){
        
        self.combatHud?.removeFromParent()
        combatHud = RTHud()
        self.combatHud?.windowPopUp!.position.y = self.size.height
        self.combatHud?.windowPopUp?.zPosition += 1
        self.addChild(combatHud!)

    }
    
    func refreshHud(){
        self.combatHud?.refreshContents()
    }
    
    func initCombat(){
        
        parentNode.removeAllChildren()
        self.removeAllChildren()
        self.removeAllActions()
        
        player = RTHero(imageNamed: "personagem")
        parentNode = SKSpriteNode(imageNamed: "")
        lado = 1
        colisao = 0
        chao = SKSpriteNode(imageNamed: "chao")
        
        velocityY  = 400
        jump = false
        sword = SKSpriteNode(imageNamed: "bgMedieval")
        btnPress = false
        pulo  = false
        voltar = false
        ladoDir = SKSpriteNode(imageNamed: "")
        ladoEsq = SKSpriteNode(imageNamed: "")
        mobCount = 0
        mobDeathCount = 0
        mobDeathLabel = SKLabelNode(text: String(0))
        bossBattle = false
        invulnerabilty = false

        
        
        //Background da Scene
        background = RTBackground(imageNamed: "bgMedieval")
        self.background!.position = CGPoint(x: 0.0, y: 0.0)
        self.background?.zPosition = -2
        
        self.addChild(background!)
        
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
        self.buttonPause!.zPosition += 2
        self.addChild(buttonPause!)
        
        //--------------------------------------------------------------------------
        
        
        //Gravidade
        physicsWorld.gravity = CGVectorMake(0.0, -15)
        self.physicsWorld.contactDelegate = self
        userInteractionEnabled = true
        
        createMob()
        
//        mobDeathLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 50)
//        self.addChild(mobDeathLabel)
        
        parentNode.size = CGSize(width: 1, height: 1)
        parentNode.position = CGPoint(x: 280, y: frame.midY)
        parentNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 100, height: 100))
        parentNode.physicsBody?.dynamic = false
        parentNode.physicsBody?.affectedByGravity = false
        parentNode.physicsBody?.allowsRotation = false
        parentNode.physicsBody?.dynamic = true
        parentNode.physicsBody?.categoryBitMask = parentBitMask
        parentNode.physicsBody?.collisionBitMask = floorBitMask | edgesBitMask
        self.addChild(parentNode)
        
        ladoDir.position = CGPoint(x: frame.maxX + 10, y: frame.midY)
        ladoDir.size = CGSize(width: 10, height: frame.maxY)
        ladoDir.physicsBody = SKPhysicsBody(rectangleOfSize: ladoDir.size)
        ladoDir.physicsBody?.dynamic = false
        ladoDir.physicsBody?.mass = 100000
        ladoDir.physicsBody?.categoryBitMask = edgesBitMask
        ladoDir.physicsBody?.collisionBitMask = heroBitMask | parentBitMask
        ladoDir.physicsBody?.pinned = true
        ladoDir.hidden = true
        self.addChild(ladoDir)
        
        ladoEsq.position = CGPoint(x: frame.minX - 10, y: frame.midY)
        ladoEsq.size = CGSize(width: 10, height: frame.maxY)
        ladoEsq.physicsBody = SKPhysicsBody(rectangleOfSize: ladoEsq.size)
        ladoEsq.physicsBody?.dynamic = true
        ladoEsq.physicsBody?.mass = 100000
        ladoEsq.physicsBody?.categoryBitMask = edgesBitMask
        ladoEsq.physicsBody?.collisionBitMask = heroBitMask | parentBitMask
        ladoEsq.physicsBody?.pinned = true
        ladoEsq.hidden = true
        self.addChild(ladoEsq)
        
        sword.size = CGSize(width: 100, height: 25)
        sword.position = CGPoint(x: 40, y: -18)
        sword.anchorPoint = CGPointMake(0.5, 0.5)
        sword.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 75, height: sword.size.height))
        sword.physicsBody?.dynamic = false
        sword.physicsBody?.pinned = true
        sword.physicsBody?.allowsRotation = false
        sword.hidden = true
        sword.physicsBody?.affectedByGravity = false
        sword.physicsBody?.dynamic = true
        sword.physicsBody?.categoryBitMask = weaponBitMask
        sword.physicsBody?.contactTestBitMask = mobsBitMask | fireballBitMask
        sword.physicsBody?.collisionBitMask = floorBitMask | weaponBitMask | parentBitMask | heroBitMask | edgesBitMask
        
        player.size = CGSize(width: 150, height: 100)
        player.position = CGPoint(x: 0, y: 0)
        player.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 50, height: 100), center: CGPoint(x: 45, y: 0))
        player.anchorPoint = CGPointMake(0.5, 0.5)
        player.physicsBody!.pinned = true
        player.physicsBody!.affectedByGravity = true
        player.physicsBody!.allowsRotation = false
        player.physicsBody!.categoryBitMask = heroBitMask
        player.physicsBody!.contactTestBitMask = mobsBitMask | fireballBitMask
        player.physicsBody!.collisionBitMask = floorBitMask | weaponBitMask | parentBitMask | heroBitMask | edgesBitMask
        player.xScale = -1
        self.parentNode.addChild(player)
        self.parentNode.addChild(sword)
        
        let tamanhoChao : CGSize = CGSize(width: chao.size.width, height: chao.size.height)
        
        chao.position = CGPoint(x: frame.midX , y: frame.minY + tamanhoChao.height/2)
        chao.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: tamanhoChao.width, height: tamanhoChao.height - 30))
        chao.physicsBody!.affectedByGravity = false
        chao.physicsBody!.dynamic = false
        chao.physicsBody!.pinned = true
        chao.physicsBody!.categoryBitMask = floorBitMask
        self.addChild(chao)
        
        btnDir.position = CGPoint(x: 200 , y: 30)
        btnDir.zPosition = 2
        btnDir.setRTButtonAction({ () -> () in
            if(self.lado == 2 || self.lado == 0){
                self.parentNode.physicsBody!.velocity = CGVectorMake(200, 0)
                self.sword.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 75, height: 30), center: CGPointMake(0.5, 0.5))
                self.sword.position.y = -18
                self.sword.physicsBody?.pinned = true
                self.sword.physicsBody?.affectedByGravity = false
                self.sword.physicsBody?.allowsRotation = false
                self.sword.physicsBody?.categoryBitMask = self.weaponBitMask
                self.sword.physicsBody?.contactTestBitMask = self.mobsBitMask
                self.sword.physicsBody?.collisionBitMask = self.floorBitMask | self.weaponBitMask | self.heroBitMask | self.parentBitMask
                self.parentNode.xScale = 1
                self.lado = 1
                self.colisao = 0
            }
        })
        addChild(btnDir)
        
        btnEsq.position = CGPoint(x: 0, y: 30)
        btnEsq.zPosition = 2
        btnEsq.setRTButtonAction({ () -> () in
            if(self.lado == 1 || self.lado == 0){
                self.parentNode.xScale = -1
                self.sword.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 75, height: 30), center: CGPointMake(0.5, 0.5))
                self.sword.position.y = -18
                self.sword.physicsBody?.pinned = true
                self.sword.physicsBody?.affectedByGravity = false
                self.sword.physicsBody?.allowsRotation = false
                self.sword.physicsBody?.categoryBitMask = self.weaponBitMask
                self.sword.physicsBody?.contactTestBitMask = self.mobsBitMask
                self.sword.physicsBody?.collisionBitMask = self.floorBitMask | self.weaponBitMask | self.heroBitMask | self.parentBitMask
                self.parentNode.physicsBody!.velocity = CGVectorMake(-200, 0)
                self.lado = 2
                self.colisao = 0
            }
        })
        addChild(btnEsq)
        
        btnPulo.position = CGPoint(x: frame.maxX - 350, y: 30)
        btnPulo.zPosition = 2
        btnPulo.setRTButtonAction({ () -> () in
            if(self.jump == false){
                self.velocityY = 500
                let action : SKAction = SKAction.runBlock({
                    self.player.physicsBody!.applyImpulse(CGVectorMake(0.0, 200.0))
                })
                let jumpAction : SKAction = SKAction.repeatAction(action, count: 5)
                let timeAir : SKAction = SKAction.waitForDuration(0.5)
                self.player.runAction(jumpAction)
                self.jump = true
                self.player.runAction(timeAir, completion: {
                    self.jump = false
                    self.physicsWorld.gravity.dy = -15
                })
            }
        })
        addChild(btnPulo)
        
        
    }
    
    func createMob() {
        let waitHalf = SKAction.waitForDuration(0.8)
        let wait = SKAction.waitForDuration(1.0)
        let mobSubir = SKAction.moveToY(280, duration: 2)
        let skeletonMob = SKAction.runBlock({
            if(self.mobCount < 15 && !self.bossBattle){
                var mob : RTMonsterSkeleton = RTMonsterSkeleton()
                mob.size = CGSize(width: 70, height: 100)
                mob.position = CGPoint(x: Int(arc4random_uniform(UInt32((self.frame.maxX - 50)))), y: Int(self.frame.minY))
                self.addChild(mob)
                mob.hidden = false
                self.mobCount++
                mob.zPosition = -1
                mob.runAction(mobSubir, completion: {
                    mob.zPosition = -1
                    mob.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 60, height: 90))
                    mob.physicsBody?.categoryBitMask = self.mobsBitMask
                    mob.physicsBody?.contactTestBitMask = self.weaponBitMask | self.floorBitMask
                    mob.physicsBody?.collisionBitMask = self.floorBitMask | self.weaponBitMask | self.edgesBitMask
                    mob.monsterMove()
                })
            }
        })
        let fireballMob = SKAction.runBlock({
            if(arc4random_uniform(2) == 0){
                if(self.mobDeathCount >= 0 && !self.bossBattle){
                    var mobFireball = RTMonster(imageNamed: "fireball")
                    mobFireball.size = CGSize(width: 60, height: 60)
                    mobFireball.position = CGPoint(x: Int(arc4random_uniform(UInt32((self.frame.maxX - 50)))), y: Int(self.frame.maxY))
                    mobFireball.physicsBody = SKPhysicsBody(circleOfRadius: 30)
                    mobFireball.physicsBody?.categoryBitMask = self.fireballBitMask
                    mobFireball.physicsBody?.contactTestBitMask = self.weaponBitMask | self.floorBitMask
                    mobFireball.physicsBody?.collisionBitMask = self.nullBitMask
                    mobFireball.physicsBody?.affectedByGravity = false
                    self.addChild(mobFireball)
                    if(mobFireball.position.x < self.frame.midX){
                        mobFireball.physicsBody?.applyImpulse(CGVector(dx: 25, dy: -30))
                        mobFireball.xScale = -1
                    } else {
                        mobFireball.physicsBody?.applyImpulse(CGVector(dx: -25, dy: -30))
                    }
                }
            }
        })
        runAction(SKAction.repeatActionForever(SKAction.sequence([waitHalf, fireballMob])))
        runAction(SKAction.repeatActionForever(SKAction.sequence([wait, skeletonMob])))
    }
    
    //Chamado a todo frame. Usado para realizar o update dos nodes da Scene, em cascata.
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
        self.enumerateChildNodesWithName("SKELETON"){
            node, stop in
            
            var aux : RTMonsterSkeleton?
            aux = node as? RTMonsterSkeleton
            aux?.update()
        }
        
        
        if(jump){
            physicsWorld.gravity.dy = -100
        }
        
 
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        let firstNode = contact.bodyA.node
        let secondNode = contact.bodyB.node
        let contactA = contact.bodyA.categoryBitMask
        let contactB = contact.bodyB.categoryBitMask
        
        // Contato de arma com monstro
        if ((contactA == weaponBitMask) && (contactB == mobsBitMask)){

            self.monsterDeath()
            self.spawnParticle(secondNode!, fire: false)
            
        }
        // Contato de monstro com arma
        else if(contactB == weaponBitMask && contactA == mobsBitMask){

            self.monsterDeath()
            self.spawnParticle(firstNode!, fire: false)
  
        }
        
    
        if((contactB == heroBitMask) && (contactA == mobsBitMask) && !invulnerabilty){
            self.damageHero()
            
        } else if((contactA == heroBitMask) && (contactB == mobsBitMask) && !invulnerabilty){
            self.damageHero()
        }
        
        if((contactB == heroBitMask) && (contactA == fireballBitMask) && !invulnerabilty){
            self.damageHero()
            
        } else if((contactA == heroBitMask) && (contactB == fireballBitMask) && !invulnerabilty){
            self.damageHero()
        }

        
        if((contactA == weaponBitMask) && (contactB == fireballBitMask)){
            self.damageHero()
            secondNode?.removeFromParent()
            
        }
        else if((contactA == fireballBitMask)  && (contactB == weaponBitMask)){
            self.damageHero()
            firstNode?.removeFromParent()
        }
        
        if((contactA == floorBitMask) && (contactB == fireballBitMask)){
            
            self.spawnParticle(secondNode!, fire: true)
        
        }
        else if((contactA == fireballBitMask) && (contactB == floorBitMask)){
            
            
            self.spawnParticle(firstNode!, fire: true)
            

        }
    }
    
    private func monsterDeath(){
        mobCount--
        mobDeathCount++
        mobDeathLabel.text = String(mobDeathCount)
        
        if(mobDeathCount >= 15){
            self.winCombat()
        }
    }
    
    private func spawnParticle(node: SKNode, fire: Bool){
        
        let sparkEmmiter: SKEmitterNode?
        let waitTime: NSTimeInterval
        
        if fire{
            sparkEmmiter = SKEmitterNode(fileNamed: "FireballDeathParticle.sks")
            sparkEmmiter!.name = "fireEmmitter"
            waitTime = 0.2
        }
        else{
            sparkEmmiter = SKEmitterNode(fileNamed: "MobDeathParticle.sks")
            sparkEmmiter!.name = "sparkEmmitter"
            waitTime = 0.6
        }
        
        let stopSpark = SKAction.runBlock({
            
            sparkEmmiter!.particleBirthRate = 0
            
            let wait = SKAction.waitForDuration(waitTime)
            self.runAction(wait, completion: {
                sparkEmmiter!.removeFromParent()
            })
            
            
        })
        
        let wait = SKAction.waitForDuration(0.6)
        let sequence = SKAction.sequence([wait, stopSpark])
        sparkEmmiter!.position = CGPointMake(node.position.x, node.position.y - 40)
        
        sparkEmmiter!.zPosition = 1
        sparkEmmiter!.targetNode = self
        sparkEmmiter!.particleLifetime = 1
        
        self.addChild(sparkEmmiter!)
        node.removeFromParent()
        self.runAction(sequence)

    }
    
    func loseCombat(){
        GCombatManager?.quitCombat(true)
    }
    
    func winCombat(){
        GCombatManager?.quitCombat(false)
    }
    
    func damageHero(){
        
        GHeroesManager?.currentHero.attributes.loseHealth(10)
        combatHud?.refreshContent(RTHud.HudAttributes.Health)
        
        //HUD
        let wait = SKAction.waitForDuration(0.25)
        let colorIn = SKAction.colorizeWithColor(SKColor.redColor(), colorBlendFactor: 0.8, duration: 0)
        let colorOut = SKAction.colorizeWithColorBlendFactor(0, duration: 0)
        let sequence = SKAction.sequence([colorIn, wait, colorOut, wait])
        let repeat = SKAction.repeatAction(sequence, count: 3)
        
        self.invulnerabilty = true
        player.runAction(repeat, completion:{
            self.invulnerabilty = false
        })
        
        if(GHeroesManager?.currentHero.attributes.health <= 1){
            self.loseCombat()
        }
    }
    
    override func didSimulatePhysics() {
        
        if(lado == 1 && colisao != 1){
            parentNode.physicsBody!.velocity = CGVector(dx: 200, dy: parentNode.physicsBody!.velocity.dy)
        } else if(lado == 2 && colisao != 2) {
            parentNode.physicsBody!.velocity = CGVector(dx: -200, dy: parentNode.physicsBody!.velocity.dy)
        } else {
            parentNode.physicsBody!.velocity = CGVector(dx: 0, dy: parentNode.physicsBody!.velocity.dy)
        }
    }
    
    //Recebe toques na Scene.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
