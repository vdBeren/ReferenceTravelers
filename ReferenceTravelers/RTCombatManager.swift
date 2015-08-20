//
//  RTCombatManager.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 19/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

//

class RTCombatManager: NSObject {
    
    var combatLevel: Int
    
    override init(){
        self.combatLevel = 0
    }
    
    func callCombat(level: Int){
        self.combatLevel = level
        
        self.combatIntroAnimation()
        
    }
    
    private func combatIntroAnimation(){
        
        
        let block = SKAction.runBlock({
            
            // GAudioManager?.playMusic(RTAudioManager.MusicsEnum.Board) COLOCAR MUSICA DE COMBATE
            
            let transition = SKTransition.crossFadeWithDuration(1.2)
            //let transition = SKTransition.pushWithDirection(SKTransitionDirection.Down, duration: 1.5)
            
            //GCombatScene!.initCombat()
            GBoardScene!.scene?.view?.presentScene(GCombatScene, transition: transition)
        })
        
        let wait = SKAction.waitForDuration(1.0)
        let combatIntroSound = SKAction.runBlock({})
        
        let sequence = SKAction.sequence([block])
        
        GBoardScene!.runAction(sequence)
    }
    
    
}
