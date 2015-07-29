//
//  RTTile.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe de Tiles. Um Tile chama uma Janela de Evento, passando um Evento, os Valores e Ações.

class RTTile: RTHideRequired {
   
    var tileDescription: String = ""
    var tileType: RTTile.TileType = TileType.Neutral
    var tileLevel: Int = 1
    var tileEvent: (Void) -> (Void) = {}
    
    enum TileType : String{
        case Explorer = "EXPLORER"
        case Urban = "URBAN"
        case Arcane = "ARCANE"
        case Neutral = "NEUTRAL"
    }
    
    init(imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "TILE"
        self.userInteractionEnabled = true
        
        self.setRTTileEvent { () -> () in
            fatalError("MUST OVERRIDE TILE EVENT")
        }

    }
    
    func setRTTileEvent(block: (Void)->(Void)) {
        self.tileEvent = block
    }
    
    
    //Recebe toques no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.tileEvent()
    }

    private func openEventWindow(windowName: RTEvent.EventType, event: RTEvent, value: Int){
        let eventWindow = RTEventWindow(imageNamed: windowName, event: event, value: value)
        (self.parent as? RTBoardScene)?.addChild(eventWindow)
    }
    
    // ========================================================================
    // GOLD
    func eventTreasure(randomBase: Int, event: RTEvent){
        var gold = GCurrentHeroAttributes.obtainGold(randomBase)
        self.openEventWindow(RTEvent.EventType.Treasure, event: event, value: gold)
    }
    
    func eventTheft(randomBase: Int, event: RTEvent){
        var gold = GCurrentHeroAttributes.loseGold(randomBase)
        self.openEventWindow(RTEvent.EventType.Theft, event: event, value: gold)
    }
    
    // ========================================================================
    // HEALTH
    func eventHeal(randomBase: Int, event: RTEvent){
        var heal = GCurrentHeroAttributes.recoverHealth(randomBase)
        self.openEventWindow(RTEvent.EventType.Heal, event: event, value: heal)
    }
    
    func eventTrap(randomBase: Int, event: RTEvent){
        var damage = GCurrentHeroAttributes.loseHealth(randomBase)
        self.openEventWindow(RTEvent.EventType.Trap, event: event, value: damage)
    }
    
    // ========================================================================
    // STATS
    func eventMiracle(attribute: RTAttributes.AttributesEnum, randomBase: Int, event: RTEvent){
        var statGain = GCurrentHeroAttributes.gainOrLoseStat(attribute, base: randomBase, gain: true)
        self.openEventWindow(RTEvent.EventType.Miracle, event: event, value: statGain)
    }
    
    func eventDisaster(attribute: RTAttributes.AttributesEnum, randomBase: Int, event: RTEvent){
        var statLoss = GCurrentHeroAttributes.gainOrLoseStat(attribute, base: randomBase, gain: false)
        self.openEventWindow(RTEvent.EventType.Disaster, event: event, value: statLoss)
    }
    // ========================================================================
    // COMBAT
    func eventCombat(event: RTEvent){
        self.openEventWindow(RTEvent.EventType.Combat, event: event, value: -1)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
