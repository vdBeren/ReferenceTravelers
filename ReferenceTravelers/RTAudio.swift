//
//  RTAudio.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 15/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//
// Uso do AVFoundation:
// http://www.rockhoppertech.com/blog/swift-avfoundation/
//

import UIKit
import SpriteKit
import AVFoundation

// Classe que gerencia todo o Audio do jogo. Ela pode tocar uma música por vez, e um numero qualquer de sons curtos.

class RTAudio: SKNode {
    
    var musicPlayer: AVAudioPlayer?
    var soundPlayerBoxing: [AVAudioPlayer] = [] //Boxing de sons! Ensinado pelo Matheus.
    
    override init(){
        super.init()
        self.setSessionPlayer()
    }
    
    // Enumerators de Sons e Musicas. Valor dos Enums tem o nome do arquivo, sem o formato! (Formato .wav para sons e .mp3 para músicas)
    enum SoundsEnum : String{
        case Switch = "LightSwitch"
        case Power = "PowerIncreasingFast"
        case Blop = "btnBlop"
        case Tot = "btnTot"
    }
    
    enum MusicsEnum : String{
        case Title = "TitleTheme"
        case Board = "MedievalTheme"
        
    }
    
    
    func playSound(soundName: SoundsEnum){
        playSound(soundName.rawValue)
    }

    func playMusic(musicName: MusicsEnum){
        playMusic(musicName.rawValue)
    }
    
    //Toca um Som curto
    private func playSound (soundName: String){
        
        var error: NSError?
        let fileURL: NSURL? = NSBundle.mainBundle().URLForResource(soundName, withExtension: ".wav")
        
        let soundPlayer: AVAudioPlayer? = AVAudioPlayer(contentsOfURL: fileURL, error: &error)
        
        soundPlayerBoxing.append(soundPlayer!)
        
        soundPlayer!.delegate = self
        soundPlayer!.prepareToPlay()
        soundPlayer!.numberOfLoops = 0 // Sem Loop
        soundPlayer!.volume = 1.0
        soundPlayer!.play()
        
    }
    
    //Toca uma musica em loop.
    private func playMusic(musicName: String) {
        
        var error: NSError?
        let fileURL: NSURL? = NSBundle.mainBundle().URLForResource(musicName, withExtension: ".mp3")
        
        self.musicPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: &error)
        if musicPlayer == nil {
            if let e = error {
                println(e.localizedDescription)
            }
        }
        
        musicPlayer!.delegate = self
        musicPlayer!.prepareToPlay()
        musicPlayer!.numberOfLoops = -1 // Loop Eterno
        musicPlayer!.volume = 1.0
        musicPlayer!.play()
    }
    
    func stopMusic() {
        if musicPlayer!.playing {
            musicPlayer!.stop()
        }
    }
    
    func toggleMusic() {
        if musicPlayer!.playing {
            musicPlayer!.pause()
        } else {
            musicPlayer!.play()
        }
    }
    
    // Definindo uma AVAudioSession
    func setSessionPlayer() {
        let session:AVAudioSession = AVAudioSession.sharedInstance()
        var error: NSError?
        if !session.setCategory(AVAudioSessionCategoryPlayback, error:&error) {
            println("could not set session category")
            if let e = error {
                println(e.localizedDescription)
            }
        }
        if !session.setActive(true, error: &error) {
            println("could not make session active")
            if let e = error {
                println(e.localizedDescription)
            }
        }
    }

    func freeBoxing(){
        soundPlayerBoxing.removeAll(keepCapacity: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: AVAudioPlayerDelegate
extension RTAudio : AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        println("finished playing \(flag)")
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
        println("\(error.localizedDescription)")
    }
}
