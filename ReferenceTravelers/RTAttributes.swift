//
//  RTAttributes.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 15/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit


// Classe que tem todos os atributos de um personagem. Formulas usadas são feitas aqui.
class RTAttributes: NSObject {
    
    var primary, agility, luck, greed, health, stamina, level: Int
    var primaryType: String
    
    override init(){
        
        //Inicialização obrigatoria das variaveis de classe do Swift
        primaryType = ""
        primary = 0
        agility = 0
        luck = 0
        greed = 0
        
        health = 100
        stamina = 100
        level = 1
    }
}
