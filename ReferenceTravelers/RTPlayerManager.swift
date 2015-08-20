//
//  RTPlayerManager.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 18/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

// Classe do jogador, é nela que a criamos a estrutura do jogador e seus atributos.
// Aqui fica as informações que devem ser salvas na "conta" do jogador, usando NSUserDefaults.

// É aqui que futuramente irá vir a estrutra e conexão com o Game Center.

class RTPlayerManager: NSObject {
   
    var gold, highScore: Int
    
    // Enumerador que contem as keys usadas para salvar as informações de jogador no NSUserDefaults
    enum PlayerKeys : String{
        case Gold = "RTPlayer_Gold"
        case HighScore = "RTPlayer_HighScore"
    }
    
    enum PlayerAttributes : String{
        case Gold = "GOLD"
        case HighScore = "HIGHSCORE"
    }
    
    override init(){
        
        self.gold = 0
        self.highScore = 0
        
    }
    
    // Realiza o salvamento das informações de jogador na estrutra NSUserDefaults.
    func savePlayerInfos(){
        
        NSUserDefaults.standardUserDefaults().setInteger(self.gold, forKey: PlayerKeys.Gold.rawValue)
        NSUserDefaults.standardUserDefaults().setInteger(self.highScore, forKey: PlayerKeys.HighScore.rawValue)
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    // Realiza o carregamento das informações de jogador na estrutra NSUserDefaults.
    func loadPlayerInfos(){
        self.gold = NSUserDefaults.standardUserDefaults().integerForKey(PlayerKeys.Gold.rawValue)
        self.highScore = NSUserDefaults.standardUserDefaults().integerForKey(PlayerKeys.HighScore.rawValue)
    }
    
}
