//
//  RTEvent.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 28/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

// Classe Evento.
// Tipos de Evento: [ Treasure, Theft ] -  [ Heal, Trap ] - [ Miracle, Disaster ] - [ Combat ]
// Valor: Define o impacto do evento.

class RTEvent: NSObject {
   
    // Enumerator de Tipos de Evento
    enum EventType : String{
        
        case Treasure = "TREASURE"
        case Theft = "THEFT"
        case Heal = "HEAL"
        case Trap = "TRAP"
        case Miracle = "MIRACLE"
        case Disaster = "DISASTER"
        case Combat = "COMBAT"
        case Blank = "BLANK"
        
    }
    
    var name, eventDescription, imageName: String
    var type: EventType
    var value: Int
    
    override init(){
        name = ""
        type = EventType.Treasure
        eventDescription = ""
        imageName = ""
        value = 0
    }
}
