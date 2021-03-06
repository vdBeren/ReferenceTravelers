//
//  RTHeroTextWindow.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 1/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTHeroTextWindow: RTTextWindow {
    
    var labelHealth, labelStamina, labelPrimary, labelAgility, labelLuck, labelGreed: RTLabelValue?
    var labelQuote, labelQuoteText: RTLabelText?
    var contentsArray: [RTLabelValue] = []
    
    var heroSelected: RTHero = RTHeroWarrior()
    var heroAttributes: RTAttributes = RTAttributes()
    
    var fontSize: CGFloat = 30.0
    
    override init(){
        
        super.init()
        
        self.name = "HEROTEXTWINDOW"
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        self.userInteractionEnabled = false
        
        
        self.initContents()
        
        self.introAnimation()
        self.floatingAnimation()
        self.idleAnimation()
        
        
    }
    
    func refreshContents(){
        
        heroSelected = GHeroesManager!.currentHero
        heroAttributes = GHeroesManager!.currentHero.attributes
        
        self.labelPrimary?.setLabelText(heroAttributes.primaryType.rawValue)
        
        var attributeArray: [Int] = [heroAttributes.maxHealth, heroAttributes.maxStamina, heroAttributes.primary, heroAttributes.agility, heroAttributes.luck, heroAttributes.greed]
        
        for (index, label) in enumerate(contentsArray){
            label.setValue(attributeArray[index])
            label.introAnimation()
            label.labelValue?.introAnimation()
        }
        
        
        self.labelQuote?.introAnimation()
        self.labelQuoteText!.finalText = heroSelected.quote
        self.labelQuoteText?.introAnimation()
    }
    
    private func initContents(){
        
        heroSelected = GHeroesManager!.currentHero
        heroAttributes = GHeroesManager!.currentHero.attributes
        
        let valueXAlign = self.size.width/5.5
        
        // INICIALIZAÇÃO DOS LABEL VALUES
        self.labelHealth = RTLabelValue(text: RTAttributes.AttributesEnum.MaxHealth.rawValue, value: heroAttributes.maxHealth, fontSize: fontSize + 2, valueXAlign: valueXAlign)
        self.labelStamina = RTLabelValue(text: RTAttributes.AttributesEnum.MaxStamina.rawValue, value: heroAttributes.maxStamina, fontSize: fontSize + 2, valueXAlign: valueXAlign)
        self.labelPrimary = RTLabelValue(text: heroAttributes.primaryType.rawValue, value: heroAttributes.primary, fontSize: fontSize, valueXAlign: valueXAlign)
        self.labelAgility = RTLabelValue(text: RTAttributes.AttributesEnum.Agility.rawValue, value: heroAttributes.agility, fontSize: fontSize, valueXAlign: valueXAlign)
        self.labelLuck = RTLabelValue(text: RTAttributes.AttributesEnum.Luck.rawValue, value: heroAttributes.luck, fontSize: fontSize, valueXAlign: valueXAlign)
        self.labelGreed = RTLabelValue(text: RTAttributes.AttributesEnum.Greed.rawValue, value: heroAttributes.greed, fontSize: fontSize, valueXAlign: valueXAlign)
        
        self.labelQuote = RTLabelText(text: "QUOTE", fontSize: fontSize + 4, minimum: 5)
        self.labelQuoteText = RTLabelText(text: "\"\(heroSelected.quote)\"", fontSize: fontSize - 4, minimum: 15)
        
        contentsArray = [labelHealth!, labelStamina!, labelPrimary!, labelAgility!, labelLuck!, labelGreed!]
        
        // Alinhamentos de Coluna e Linha (Relativo)
        let alignColumnA = self.windowPopUp!.size.width/20
        let alignColumnB = self.windowPopUp!.size.width/3.6
        let alignColumnC = self.windowPopUp!.size.width/1.35
        
        let alignRowA = self.windowPopUp!.size.height/1.25
        let alignRowB = self.windowPopUp!.size.height/2.0
        let alignRowC = self.windowPopUp!.size.height/5
        
        // Arrays com alinhamentos
        let alignColumnArray = [alignColumnA, alignColumnB, alignColumnC]
        let alignRowArray = [alignRowA, alignRowB, alignRowC]
        
        // Arrays com conteudo de cada linha / coluna
        let labelArrayRowA = [self.labelHealth!, self.labelStamina!, self.labelQuote!]
        let labelArrayRowB = [self.labelPrimary!, self.labelLuck!, self.labelQuoteText!]
        let labelArrayRowC = [self.labelAgility!, self.labelGreed!]
        
        // Array de linhas
        let rowArray = [labelArrayRowA, labelArrayRowB, labelArrayRowC]
        
        // Realiza os posicionamentos de todos os nodes de texto.
        for (row, array) in enumerate(rowArray){
            for (column, label) in enumerate(array){
                label.position.x += alignColumnArray[column]
                label.position.y += alignRowArray[row]
                label.fontColor = SKColor.orangeColor()
                label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
                self.windowPopUp!.addChild(label)
                label.introAnimation()
                
            }
        }
        
        self.labelQuoteText!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        self.labelQuote!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        self.labelQuoteText!.fontColor = SKColor.whiteColor()
        
    }
    
    private func idleAnimation(){
        // Animaçãozinha pra janela de texto que roda a intro das labels de tempos em tempos.
        
        let animationArray = [self.labelHealth!, self.labelStamina!, self.labelPrimary!, self.labelAgility!, self.labelLuck!, self.labelGreed!, self.labelQuote!, self.labelQuoteText!]
        
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
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        labelHealth!.introAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
