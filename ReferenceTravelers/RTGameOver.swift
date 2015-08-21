//
//  RTGameOver.swift
//  ReferenceTravelers
//
//  Created by Bruno de Paula Munhoz on 21/08/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTGameOver: SKScene {
    var gameLabel : RTLabelText?
    var overLabel : RTLabelText?
    var tap : RTLabelText?
    var player : SKSpriteNode?
    var skeleton : SKSpriteNode?
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        var playerSizeY = self.frame.midX / 2.5
        
        skeleton = SKSpriteNode(imageNamed: "skeleton")
        skeleton!.size = CGSize(width: skeleton!.size.width/9, height: skeleton!.size.height/9)
        skeleton!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        skeleton!.position = CGPoint(x: self.frame.maxX / 1.75, y: self.frame.maxY / 5.5)
        skeleton!.alpha = 0
        addChild(skeleton!)
        
        player = SKSpriteNode(imageNamed: "personagem")
        player!.size = CGSize(width: player!.size.width/8, height: player!.size.height/8)
        player!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player!.position = CGPoint(x: self.frame.maxX / 2, y: self.frame.maxY / 5)
        addChild(player!)
        
        tap = RTLabelText(text: "Tap to continue", fontSize: 40, minimum: 15)
        tap!.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 100)
        addChild(tap!)
        
        gameLabel = RTLabelText(text: "GAME", fontSize: 100, minimum: 4)
        gameLabel!.position = CGPoint(x: self.frame.maxX / 2.7, y: self.frame.midY)
        addChild(gameLabel!)
        
        overLabel = RTLabelText(text: "OVER", fontSize: 100, minimum: 4)
        overLabel!.position = CGPoint(x: self.frame.maxX / 1.5, y: self.frame.midY)
        addChild(overLabel!)
        
        runAction(SKAction.waitForDuration(0.7), completion :{
            self.animation()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sceneChange(){
        GHeroSelectionScene!.returningFromStage()
        let transition = SKTransition.crossFadeWithDuration(1.0)
        self.scene?.view?.presentScene(GHeroSelectionScene, transition: transition)
    }
    
    func animation(){
        let wait = SKAction.waitForDuration(0.5)
        let waitLabel = SKAction.waitForDuration(2)
        let fadeIn = SKAction.fadeInWithDuration(4)
        let fadeOut = SKAction.fadeAlphaTo(0.05, duration: 1.5)
        let fadeInSkt = SKAction.fadeInWithDuration(2)
        let fadeInPlayer = SKAction.colorizeWithColor(SKColor.redColor(), colorBlendFactor: 1, duration: 1.5)
        let blkPlayer = SKAction.runBlock({
            self.player!.runAction(fadeOut)
            self.player!.runAction(fadeInPlayer)
        })
        let blkGame = SKAction.runBlock({
            self.gameLabel!.introAnimation()
            self.gameLabel!.runAction(fadeIn)
        })
        let blkOver = SKAction.runBlock({
            self.overLabel!.introAnimation()
            self.overLabel!.runAction(fadeIn)
        })
        let blkTap = SKAction.runBlock({
            self.tap!.introAnimation()
        })
        let sequence = SKAction.sequence([blkPlayer, waitLabel, blkGame, wait, blkOver, wait, blkTap])
        
        runAction(sequence)
        self.skeleton!.runAction(fadeInSkt)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        sceneChange()
    }
}
