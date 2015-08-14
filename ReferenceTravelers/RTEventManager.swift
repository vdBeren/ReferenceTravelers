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

    var eventType: RTEvent.EventType
    var name, desc, imgName: String
    var value: Int
    
    // Arrays dos Tipos de Eventos.
    var eventTreasure: [RTEvent] = []
    var eventTheft: [RTEvent] = []
    var eventHeal: [RTEvent] = []
    var eventTrap: [RTEvent] = []
    var eventMiracle: [RTEvent] = []
    var eventDisaster: [RTEvent] = []
    var eventCombat: [RTEvent] = []
    var eventBlank: [RTEvent] = []
    var eventStart: [RTEvent] = []
    var eventEnd: [RTEvent] = []
    
    override init(){
        
        self.eventType = RTEvent.EventType.Treasure
        self.name = ""
        self.desc = ""
        self.imgName = ""
        self.value = 0
        
        super.init()
        
        // Chama as funções que adicionam os eventos ao vetor de eventos
        self.eventTreasures()
        self.eventThefts()
        self.eventHeals()
        self.eventTraps()
        self.eventMiracles()
        self.eventDisasters()
        
        self.eventCombats()
        
        self.eventBlanks()
        
        self.eventStarts()
        self.eventEnds()
    }
    
    // Seleciona um evento do tipo escolhido
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
            
        case RTEvent.EventType.Blank:
            return eventBlank.pickRandomItem()
            
        case RTEvent.EventType.Start:
            return eventStart.pickRandomItem()
            
        case RTEvent.EventType.End:
            return eventEnd.pickRandomItem()
            
        default:
            break
        }
    }
    
    private func eventTreasures(){
        
        self.eventType = RTEvent.EventType.Treasure
        
        // ========================================================================
        self.name = "Secret Stash"
        self.desc = "You found a secret stash, maybe it 'belong' to some pirates?"
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================
        
    }
    
    private func eventThefts(){
        
        self.eventType = RTEvent.EventType.Theft
        
        // ========================================================================
        self.name = "Pickpocket"
        self.desc = "You bump into someone. Some of the gold in your pocket is *PUFF* gone."
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================
    }
    
    private func eventHeals(){
        
        self.eventType = RTEvent.EventType.Heal
        
        // ========================================================================
        self.name = "The Inn"
        self.desc = "You rest at the Inn. Nothing better to heal ills and wounds!"
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================
    }
    
    private func eventTraps(){
        
        self.eventType = RTEvent.EventType.Trap
        
        // ========================================================================
        self.name = "The Pit"
        self.desc = "You fell into the pit. *I fell into the piit, we all fell into that piit*" // Referencia Parks and Rec :P
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================
    }
    
    private func eventMiracles(){
        
        self.eventType = RTEvent.EventType.Miracle
        
        // ========================================================================
        self.name = "Blessing"
        self.desc = "You sneeze. Someone says 'Bless you!'. You are now blessed."
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================
    }
    
    private func eventDisasters(){
        
        self.eventType = RTEvent.EventType.Disaster
        
        // ========================================================================
        self.name = "Earthquake"
        self.desc = "Wow, that was unexpected. You hurt yourself, pretty bad."
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================
    }
    
    private func eventCombats(){
        
        self.eventType = RTEvent.EventType.Combat
        
        // ========================================================================
        self.name = "Some enemies"
        self.desc = "You know, just some enemies, nothing remarkable."
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================
    }
    
    private func eventBlanks(){
        self.eventType = RTEvent.EventType.Blank
        
        // ========================================================================
        self.name = "Nothing"
        self.desc = "You stumble into nothing at all."
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================

    }
    
    private func eventStarts(){
        self.eventType = RTEvent.EventType.Start
        
        // ========================================================================
        self.name = "The Beginning"
        self.desc = "The first step of your adventure! (Touch to continue)"
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================
        
    }
    
    private func eventEnds(){
        self.eventType = RTEvent.EventType.Start
        
        // ========================================================================
        self.name = "The End"
        self.desc = "So you get nothing, you lose, GOOD DAY SIR!"
        self.imgName = ""
        self.value = 1
        
        self.addEvent(eventType, name: name, desc: desc, imgName: imgName, value: value)
        // ========================================================================
        
    }
    
    
    private func addEvent(eventType: RTEvent.EventType, name: String, desc: String, imgName: String, value: Int){
        let event = RTEvent()
        event.type = eventType
        event.name = name
        event.eventDescription = desc
        event.imageName = imgName
        event.value = value
        
        switch eventType{
        case RTEvent.EventType.Treasure:
            self.eventTreasure.append(event)
            
        case RTEvent.EventType.Theft:
            self.eventTheft.append(event)
            
        case RTEvent.EventType.Heal:
            self.eventHeal.append(event)
            
        case RTEvent.EventType.Trap:
            self.eventTrap.append(event)
            
        case RTEvent.EventType.Miracle:
            self.eventMiracle.append(event)
            
        case RTEvent.EventType.Disaster:
            self.eventDisaster.append(event)
            
        case RTEvent.EventType.Combat:
            self.eventCombat.append(event)
            
        case RTEvent.EventType.Blank:
            self.eventBlank.append(event)
            
        case RTEvent.EventType.Start:
            self.eventStart.append(event)
            
        case RTEvent.EventType.End:
            self.eventEnd.append(event)
            
        default:
            break
        }

    }
    
    //MARK: Event Calls
    private func openEventWindow(event: RTEvent, value: Int){
        let eventWindow = RTEventWindow(event: event, value: value)
        eventWindow.position = CGPoint(x: GBoardScene!.size.width/2, y: GBoardScene!.size.height/2)
        GBoardScene!.addChild(eventWindow)
    }
    
    // ========================================================================
    // GOLD
    func callEventTreasure(randomBase: Int){
        let event = GEventManager!.pickEvent(RTEvent.EventType.Treasure)
        
        let gold = GHeroesManager!.currentHero.attributes.obtainGold(randomBase)
        self.openEventWindow(event, value: gold)
    }
    
    func callEventTheft(randomBase: Int){
        let event = GEventManager!.pickEvent(RTEvent.EventType.Theft)
        
        let gold = GHeroesManager!.currentHero.attributes.loseGold(randomBase)
        self.openEventWindow(event, value: gold)
    }
    
    // ========================================================================
    // HEALTH
    func callEventHeal(randomBase: Int){
        let event = GEventManager!.pickEvent(RTEvent.EventType.Heal)
        
        let heal = GHeroesManager!.currentHero.attributes.recoverHealth(randomBase)
        self.openEventWindow(event, value: heal)
    }
    
    func callEventTrap(randomBase: Int){
        let event = GEventManager!.pickEvent(RTEvent.EventType.Trap)
        
        let damage = GHeroesManager!.currentHero.attributes.loseHealth(randomBase)
        self.openEventWindow(event, value: damage)
    }
    
    // ========================================================================
    // STATS
    func callEventMiracle(attribute: RTAttributes.AttributesEnum, randomBase: Int){
        let event = GEventManager!.pickEvent(RTEvent.EventType.Miracle)
        
        let statGain = GHeroesManager!.currentHero.attributes.gainOrLoseStat(attribute, base: randomBase, gain: true)
        self.openEventWindow(event, value: statGain)
    }
    
    func callEventDisaster(attribute: RTAttributes.AttributesEnum, randomBase: Int){
        let event = GEventManager!.pickEvent(RTEvent.EventType.Disaster)
        
        let statLoss = GHeroesManager!.currentHero.attributes.gainOrLoseStat(attribute, base: randomBase, gain: false)
        self.openEventWindow(event, value: statLoss)
    }
    
    // ========================================================================
    // COMBAT
    func callEventCombat(){
        let event = GEventManager!.pickEvent(RTEvent.EventType.Combat)
        
        self.openEventWindow(event, value: -1)
    }
    
    // ========================================================================
    // BLANK
    func callEventBlank(){
        let event = GEventManager!.pickEvent(RTEvent.EventType.Blank)
        
        self.openEventWindow(event, value: -1)
    }

    // ========================================================================
    // START
    func callEventStart(){
        let event = GEventManager!.pickEvent(RTEvent.EventType.Start)
        
        self.openEventWindow(event, value: -1)
    }
    
    // ========================================================================
    // END
    func callEventEnd(){
        let event = GEventManager!.pickEvent(RTEvent.EventType.End)
        
        self.openEventWindow(event, value: -1)
    }
    
}

// MARK: pickRandomItem!
extension Array {
    func pickRandomItem() -> T {
       // println("\(self.count-1)")
        let index = Int(arc4random_uniform(UInt32(self.count-1)))
        return self[index]
    }
}

