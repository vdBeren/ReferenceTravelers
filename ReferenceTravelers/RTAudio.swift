//
//  RTAudio.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 15/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

//Classe que cuida dos sons do jogo.

class RTAudio: SKNode {
    
    // Enumerators de Sons e Musicas. Valor dos Enums tem o nome do arquivo com formato (.mp3, .wav)
    enum SoundsEnum : String{
        case Golpe = "GOLPE.wav"
        case Dano = "DANO.wav"
    }
    
    enum MusicsEnum : String{
        case Title = "TITLE.mp3"
        case Combate = "COMBATE.mp3"
        
    }
    
    
    func playSound(soundName: SoundsEnum){
        playSound(soundName.rawValue)
    }
    
    func playMusic(musicName: MusicsEnum){
        playMusic(musicName.rawValue)
    }
    
    //Toca um Som curto
    private func playSound (soundName: String){
        let playSoundAction = SKAction.playSoundFileNamed(soundName, waitForCompletion: false)
        runAction(playSoundAction)
    }
    
    //Toca uma musica em loop, esperando o tempo dela completar
    private func playMusic (musicName: String){
        let playMusicAction = SKAction.playSoundFileNamed(musicName, waitForCompletion: true)
        runAction(SKAction.repeatActionForever(playMusicAction))
        
    }
}
