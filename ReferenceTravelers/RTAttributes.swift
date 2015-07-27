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
    
    var primary, agility, luck, greed, health, stamina, level, maxHealth, maxStamina: Int
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
        maxHealth = 100
        maxStamina = 100
        
        level = 1
    }
    
    // ========================================================================
    // GOLD
    func obtainGold(base: Int){
        GGold += formulaLoseGold(base)
    }
    
    func loseGold(base: Int){
        GGold -= checkForNegative(formulaLoseGold(base))
    }
    
    private func formulaObtainGold(base: Int) -> Int{
        return base + greed/4 + luck/6
    }
    
    private func formulaLoseGold(base: Int) -> Int{
        return base - greed/4 - luck/6
    }
    // ========================================================================
    // HEALTH
    func gainHealth(base: Int){
        health += formulaRecoverHealth(base)
    }
    
    func loseHealth(base: Int){
        health -= checkForNegative(formulaLoseHealth(base))
    }
    
    private func formulaRecoverHealth(base: Int) -> Int{
        return base + maxHealth/3
    }
    
    private func formulaLoseHealth(base: Int) -> Int{
        return base
    }
    // ========================================================================
    // STAMINA
    func gainStamina(base: Int){
        stamina += formulaRecoverStamina(base)
    }
    
    func loseStamina(base: Int){
        stamina -= checkForNegative(formulaLoseStamina(base))
    }
    
    private func formulaRecoverStamina(base: Int) -> Int{
        return base + maxStamina/2
    }
    
    private func formulaLoseStamina(base: Int) -> Int{
        return base
    }
    // ========================================================================
    
    private func checkForNegative(value: Int) -> Int{
        if value < 0{
            return 0
        }
        
        return value
    }

}
