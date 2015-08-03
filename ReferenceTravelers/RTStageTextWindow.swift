//
//  RTStageTextWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTStageTextWindow: RTWindow {
 
    var labelTitle, labelDescription, labelDifficulty: RTLabelText?
    
    var stageSelected: RTStage = RTStageMedieval()
    var contentsArray: [RTLabelText] = []
    
    var fontSize: CGFloat = 30.0
    
    init(){
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: "windowText")
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "STAGETEXTWINDOW"
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        self.userInteractionEnabled = false
        
        
        self.initContents()
        
        self.introAnimation()
        self.floatingAnimation()
        self.idleAnimation()
        
        
    }
    
    func refreshContents(){
        
        stageSelected = GStageManager!.currentStage
        
        var infoArray: [String] = [stageSelected.title, stageSelected.information, stageSelected.difficulty.rawValue]
        
        for (index, label) in enumerate(contentsArray){
            label.setLabelText(infoArray[index])
            label.introAnimation()
        }
        
        difficultyColor()
    }
    
    private func initContents(){
        
        stageSelected = GStageManager!.currentStage
        
        // INICIALIZAÇÃO DOS LABELS
        self.labelTitle = RTLabelText(text: stageSelected.title, fontSize: self.fontSize + 8, minimum: 15)
        self.labelDescription = RTLabelText(text: stageSelected.information, fontSize: self.fontSize - 4, minimum: 15)
        self.labelDifficulty = RTLabelText(text: stageSelected.difficulty.rawValue, fontSize: self.fontSize + 4, minimum: 12)
        
        self.contentsArray = [labelTitle!, labelDescription!, labelDifficulty!]
        
        // Alinhamentos de Coluna e Linha (Relativo)
        let alignColumnA = self.size.width/20
        let alignColumnB = self.size.width/3.6
        let alignColumnC = self.size.width/1.05
        
        let alignRowA = self.size.height/1.25
        let alignRowB = self.size.height/2.0
        let alignRowC = self.size.height/5
        
        // Arrays com alinhamentos
        let alignColumnArray = [alignColumnA, alignColumnB, alignColumnC]
        let alignRowArray = [alignRowA, alignRowB, alignRowC]
        
        // Arrays com conteudo de cada linha / coluna
        let labelBlank: RTLabelText = RTLabelText(text: "", fontSize: 1, minimum: 1)
        let labelBlank2: RTLabelText = RTLabelText(text: "", fontSize: 1, minimum: 1)
        
        let labelArrayRowA = [self.labelTitle!, labelBlank, self.labelDifficulty!]
        let labelArrayRowB = [self.labelDescription!]
        let labelArrayRowC = [labelBlank2]
        
        // Array de linhas
        let rowArray = [labelArrayRowA, labelArrayRowB, labelArrayRowC]
        
        // Realiza os posicionamentos de todos os nodes de texto.
        for (row, array) in enumerate(rowArray){
            for (column, label) in enumerate(array){
                label.position.x += alignColumnArray[column]
                label.position.y += alignRowArray[row]
                label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
                self.addChild(label)
                label.introAnimation()
                
            }
        }
        
        self.labelDifficulty!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        self.labelTitle!.fontColor = SKColor.orangeColor()
        difficultyColor()
    }
    
    
    private func difficultyColor(){
        
        var color: SKColor
        
        switch stageSelected.difficulty{
        case RTStage.Difficulty.Easy:
            color = SKColor.greenColor()
            
        case RTStage.Difficulty.Normal:
            color = SKColor.whiteColor()
            
        case RTStage.Difficulty.Hard:
            color = SKColor.redColor()
            
        case RTStage.Difficulty.Expert:
            color = SKColor.blackColor()
            
        default:
            break;
            
        }
        
        self.labelDifficulty?.fontColor = color
        
    }
    
    private func idleAnimation(){
        
        // Animaçãozinha pra janela de texto que roda a intro das labels de tempos em tempos.
        
        let animationArray = [self.labelTitle!, self.labelDifficulty!, self.labelDescription!]
        
        let block = SKAction.runBlock({
            
            let random = arc4random_uniform(UInt32(animationArray.count))
            for (index, label) in enumerate(animationArray){
                if index == Int(random){
                    label.introAnimation()
                }
                
            }
            
        })
        
        let wait = SKAction.waitForDuration(3.0)
        let sequence = SKAction.sequence([wait, block, wait])
        let forever = SKAction.repeatActionForever(sequence)
        
        self.runAction(forever)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}