//
//  RTHeroManager.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTHeroManager: NSObject {
    
    var heroArray: [RTHero] = []
    
    override init(){
        
        super.init()
        
        sortHeroes()
    }
    
    private func sortHeroes(){
        let heroWarrior = RTHeroWarrior()
        let heroRogue = RTHeroRogue()
        let heroMage = RTHeroMage()
        
        let arrayHeroes = [heroWarrior, heroRogue, heroMage]
        
        for hero in arrayHeroes{
            heroArray.append(hero)
        }
    }
}
