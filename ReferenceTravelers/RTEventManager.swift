//
//  RTEventManager.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 28/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

// Classe que gerencia os eventos do jogo, como por exemplo o sorteio de um evento de seu array de eventos.
// TODO: Ler os eventos a partir de um arquivo, de forma a ficar mais simples de adicionar eventos.

class RTEventManager: NSObject {
    
    var event: RTEvent = RTEvent()
    
    // Arrays de Tipos de eventos.
    
    var eventTreasure: [RTEvent] = []
    var eventTheft: [RTEvent] = []
    var eventHeal: [RTEvent] = []
    var eventTrap: [RTEvent] = []
    var eventMiracle: [RTEvent] = []
    var eventDisaster: [RTEvent] = []
    var eventCombat: [RTEvent] = []
    
    override init(){
        
        super.init()
        
        self.eventTreasures()
        self.eventThefts()
        self.eventHeals()
        self.eventTraps()
        self.eventMiracles()
        self.eventDisasters()
        self.eventCombats()
    }
    
    func pickEvent(eventType: RTEvent.EventType) -> RTEvent{
        
        switch eventType{
        case RTEvent.EventType.Treasure:
            return eventTreasure.pickRandomItem()
            
        case RTEvent.EventType.Theft:
            return eventTheft.pickRandomItem()
            
        case RTEvent.EventType.Heal:
            return eventHeal.pickRandomItem()
            
        case RTEvent.EventType.Trap:
            return eventTrap.pickRandomItem()
            
        case RTEvent.EventType.Miracle:
            return eventMiracle.pickRandomItem()
            
        case RTEvent.EventType.Disaster:
            return eventDisaster.pickRandomItem()
            
        case RTEvent.EventType.Combat:
            return eventCombat.pickRandomItem()
            
        default:
            break
        }
    }
    
    private func eventTreasures(){
        
        // ========================================================================
        event = RTEvent()
        event.type = RTEvent.EventType.Treasure
        
        event.name = "Secret Stash"
        event.eventDescription = "You found a secret stash, maybe it 'belong' to some pirates?"
        event.imageName = ""
        event.value = 1
        self.eventTreasure.append(event)
        // ========================================================================
        
    }
    
    private func eventThefts(){
        
        // ========================================================================
        event = RTEvent()
        event.type = RTEvent.EventType.Theft
        
        event.name = "Pickpocket"
        event.eventDescription = "As you walk, you bump into someone. Some of the gold in your pocket is *PUFF* gone."
        event.imageName = ""
        event.value = 1
        self.eventTheft.append(event)
        // ========================================================================
    }
    
    private func eventHeals(){
        
        // ========================================================================
        event = RTEvent()
        event.type = RTEvent.EventType.Heal
        
        event.name = "The Inn"
        event.eventDescription = "You rest at the Inn. Nothing better to heal ills and wounds!"
        event.imageName = ""
        event.value = 1
        self.eventHeal.append(event)
        // ========================================================================
    }
    
    private func eventTraps(){
        
        // ========================================================================
        event = RTEvent()
        event.type = RTEvent.EventType.Trap
    
        event.name = "The Pit"
        event.eventDescription = "You fell into the pit. *I fell into the pit, we all fell into that pit*" // Referencia Parks and Rec :P
        event.imageName = ""
        event.value = 1
        self.eventTrap.append(event)
        // ========================================================================
    }
    
    private func eventMiracles(){
        
        // ========================================================================
        event = RTEvent()
        event.type = RTEvent.EventType.Miracle
        
        event.name = "Blessing"
        event.eventDescription = "You sneeze. Someone says 'Bless you!'. You are now blessed."
        event.imageName = ""
        event.value = 1
        self.eventMiracle.append(event)
        // ========================================================================
    }
    
    private func eventDisasters(){
        
        // ========================================================================
        event = RTEvent()
        event.type = RTEvent.EventType.Disaster
        
        event.name = "Earthquake"
        event.eventDescription = "Wow, that was unexpected. You hurt yourself, pretty bad."
        event.imageName = ""
        event.value = 1
        self.eventDisaster.append(event)
        // ========================================================================
    }
    
    private func eventCombats(){
        
        // ========================================================================
        event = RTEvent()
        event.type = RTEvent.EventType.Combat
        
        event.name = "Some enemies"
        event.eventDescription = "You know, just some enemies, nothing remarkable."
        event.imageName = ""
        event.value = 1
        self.eventCombat.append(event)
        // ========================================================================
    }
    
}

// MARK: pickRandomItem!
extension Array {
    func pickRandomItem() -> T {
        let index = Int(arc4random_uniform(UInt32(self.count-1)))
        return self[index]
    }
}

