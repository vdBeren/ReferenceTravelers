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
    var primaryBuff, agilityBuff, luckBuff, greedBuff: Int
    var primaryType: RTAttributes.PrimariesEnum
    var minimumStatValue: Int = 1
    
    enum PrimariesEnum : String{
        case Strength = "STRENGTH"
        case Dexterity = "DEXTERITY"
        case Intelligence = "INTELLECT"
    }
    
    enum AttributesEnum : String{
        case Primary = "PRIMARY"
        case Agility = "AGILITY"
        case Luck = "LUCK"
        case Greed = "GREED"
        case MaxHealth = "HEALTH"
        case MaxStamina = "STAMINA"
    }
    
    override init(){
        
        //Inicialização obrigatoria das variaveis de classe do Swift
        primaryType = RTAttributes.PrimariesEnum.Strength
        primary = 0
        agility = 0
        luck = 0
        greed = 0
        
        primaryBuff = 0
        agilityBuff = 0
        luckBuff = 0
        greedBuff = 0
        
        health = 100
        stamina = 100
        maxHealth = 100
        maxStamina = 100
        
        level = 1
    }
    
    // ========================================================================
    // GOLD
    func obtainGold(base: Int) -> Int{
        var result = formulaObtainGold(base)
        GPlayerManager.gold += result
        
        GHud?.refreshContent(RTHud.HudAttributes.Gold)
        
        return result
    }
    
    func loseGold(base: Int) -> Int{
        var result = formulaLoseGold(base)
        GPlayerManager.gold = checkForNegative(GPlayerManager.gold + result)
        
        GHud?.refreshContent(RTHud.HudAttributes.Gold)
        
        return result
    }
    
    private func formulaObtainGold(base: Int) -> Int{
        return base + greed/4 + luck/6
    }
    
    private func formulaLoseGold(base: Int) -> Int{
        return base - greed/4 - luck/6
    }
    // ========================================================================
    // HEALTH
    func recoverHealth(base: Int) -> Int{
        var result = formulaRecoverHealth(base)
        health = checkForMax(health + result, max: self.maxHealth)
        
        GHud?.refreshContent(RTHud.HudAttributes.Health)
        
        return result
    }
    
    func loseHealth(base: Int) -> Int{
        var result = checkForNegative(formulaLoseHealth(base))
        health = checkForMin(health - result)
        
        GHud?.refreshContent(RTHud.HudAttributes.Health)
        
        return result
    }
    
    private func formulaRecoverHealth(base: Int) -> Int{
        return base + maxHealth/3
    }
    
    private func formulaLoseHealth(base: Int) -> Int{
        return base
    }
    // ========================================================================
    // STAMINA
    func recoverStamina(base: Int) -> Int{
        var result = checkForMax(formulaRecoverStamina(base), max: self.maxStamina)
        stamina += result
        
        GHud?.refreshContent(RTHud.HudAttributes.Stamina)
        
        return result
    }
    
    func loseStamina(base: Int) -> Int{
        var result = checkForNegative(formulaLoseStamina(base))
        stamina = checkForMin(stamina - result)
        
        GHud?.refreshContent(RTHud.HudAttributes.Stamina)
        
        return result
    }
    
    private func formulaRecoverStamina(base: Int) -> Int{
        return base + maxStamina/2
    }
    
    private func formulaLoseStamina(base: Int) -> Int{
        return base
    }
    // ========================================================================
    // PRIMARY - AGILITY - LUCK - GREED
    func gainOrLoseStat(statType: RTAttributes.AttributesEnum, base: Int, gain: Bool) -> Int{
        
        var statValue = formulaStat(base)
        
        if !gain{
            statValue *= -1
        }
        
        switch statType{
        case RTAttributes.AttributesEnum.Primary:
            GHud?.refreshContent(RTHud.HudAttributes.PrimaryBuff)
            return checkForMin(self.primaryBuff + statValue)
            
        case RTAttributes.AttributesEnum.Agility:
            GHud?.refreshContent(RTHud.HudAttributes.AgilityBuff)
            return checkForMin(self.agilityBuff + statValue)
            
        case RTAttributes.AttributesEnum.Luck:
            GHud?.refreshContent(RTHud.HudAttributes.LuckBuff)
            return checkForMin(self.luckBuff + statValue)
            
        case RTAttributes.AttributesEnum.Greed:
            GHud?.refreshContent(RTHud.HudAttributes.GreedBuff)
            return checkForMin(self.greedBuff + statValue)
            
        case RTAttributes.AttributesEnum.MaxHealth:
            GHud?.refreshContent(RTHud.HudAttributes.MaxHealth)
            return checkForMin(self.maxHealth + statValue)
            
        case RTAttributes.AttributesEnum.MaxStamina:
            GHud?.refreshContent(RTHud.HudAttributes.MaxStamina)
            return checkForMin(self.maxStamina + statValue)
            
        default:
            break
        }
        
    }
    
    private func formulaStat(base: Int) -> Int{
        return base
    }
    // ========================================================================
    
    func pickRandomAttribute() -> RTAttributes.AttributesEnum{
        let random = arc4random_uniform(4)
        switch random{
        case 0:
            return AttributesEnum.Primary
        case 1:
            return AttributesEnum.Agility
        case 2:
            return AttributesEnum.Luck
        case 3:
            return AttributesEnum.Greed
        default:
            return AttributesEnum.Primary
        }
    }
    
    private func checkForNegative(value: Int) -> Int{
        if value < 0{
            return 0
        }
        
        return value
    }
    
    private func checkForMax(value: Int, max: Int) -> Int{
        if value >= max{
            return max
        }
        
        return value
    }
    
    private func checkForMin(value: Int) -> Int{
        if value < minimumStatValue{
            return minimumStatValue
        }
        
        return value
    }
    
}
