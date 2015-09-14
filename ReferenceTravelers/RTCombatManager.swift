//
//  RTCombatManager.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 19/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Gerenciador do combate

class RTCombatManager: NSObject {
    
    var combatLevel: Int
    
    override init(){
        self.combatLevel = 0
    }
    
    func callCombat(level: Int){
        self.combatLevel = level
        
        self.combatIntroAnimation()
        
    }
    
    func quitCombat(gameOver: Bool){
        
        if gameOver{
            GAudioManager?.playMusic(RTAudioManager.MusicsEnum.Title)
            GGameOverScene?.initGameOver()
            
            GHeroesManager?.currentHero.attributes.restoreAttributes()
            
            let transition = SKTransition.crossFadeWithDuration(1.2)
            GCombatScene!.scene?.view?.presentScene(GGameOverScene, transition: transition)
            
            
        }
        else{
            
            GAudioManager?.playMusic(RTAudioManager.MusicsEnum.Board)

            let transition = SKTransition.crossFadeWithDuration(1.5)
            GCombatScene!.scene?.view?.presentScene(GBoardScene, transition: transition)
            
            GBoardScene!.refresehHud()
            GBoardScene!.setCurrentTileUsed()
            
            
        }
    }
    
    private func combatIntroAnimation(){
        
        
        let block = SKAction.runBlock({
            
            // GAudioManager?.playMusic(RTAudioManager.MusicsEnum.Board) COLOCAR MUSICA DE COMBATE
            
            let transition = SKTransition.crossFadeWithDuration(2.0)
            
            GCombatScene!.initCombat()
            GCombatScene!.refreshHud()
            GBoardScene!.scene?.view?.presentScene(GCombatScene, transition: transition)
        })
        
        let wait = SKAction.waitForDuration(1.0)
        let combatIntroSound = SKAction.runBlock({})
        
        let sequence = SKAction.sequence([block])
        
        GBoardScene!.runAction(sequence)
    }
    
    
}
