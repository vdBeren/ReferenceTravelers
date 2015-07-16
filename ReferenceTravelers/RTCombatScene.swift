//
//  RTCombatScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


class RTCombatScene: SKScene{
    var player : SKSpriteNode!
    var lado : Int = 1
    var chao : SKSpriteNode!
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        //Node de Audio
//        addChild(audioNode!)
//        audioNode!.playMusic(RTAudio.MusicsEnum.Combate)
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bg0")
        backgroundNode!.position = CGPoint(x: 0.0, y: 0.0)
        addChild(backgroundNode!)
        
        //Gravidade
        physicsWorld.gravity = CGVectorMake(0.0, -0.1)
        userInteractionEnabled = true
        
        player = SKSpriteNode(imageNamed: "Spaceship")
        player.position = CGPoint(x: 200, y: 200)
        player.setScale(0.5)
        player.physicsBody = SKPhysicsBody(circleOfRadius: player!.size.width / 2)
        player.physicsBody!.affectedByGravity = true
        player.physicsBody!.allowsRotation = false
        addChild(player)
        
        let tamanhoChao : CGSize = CGSize(width: 700, height: 10)
        
        chao = SKSpriteNode(color: UIColor(red: 100, green: 100, blue: 100, alpha: 100), size: tamanhoChao)
        chao.position = CGPoint(x: 350 , y: 0)
        chao.physicsBody = SKPhysicsBody(rectangleOfSize: tamanhoChao)
        chao.physicsBody!.affectedByGravity = false
        chao.physicsBody!.dynamic = false
        addChild(chao)
        
        
    }

    //Chamado a todo frame. Usado para realizar o update dos nodes da Scene, em cascata.
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
        if(lado == 1){
            player.physicsBody!.velocity=CGVectorMake(200, 0);
        } else {
            player.physicsBody!.velocity=CGVectorMake(-200, 0);
        }
    }
    
    
    //Recebe toques na Scene.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            if(location.x > scene!.size.width / 2 && lado == 0){
                player.getMirror()
                lado = 1
                
            } else if(location.x <= scene!.size.width / 2 && lado == 1) {
                player.getMirror()
                lado = 0
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
