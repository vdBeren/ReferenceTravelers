//
//  RTHud.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 17/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


// Classe da HUD, usada no tabuleiro e no modo combate. Ela contem as informações do heroi.
// TODO: Colocar barras para Health e Stamina e cores para os atributos.

class RTHud: RTWindow {
    
    var labelHealth, labelStamina: RTLabelValueHud?
    var labelPrimary, labelAgility, labelLuck, labelGreed: RTLabelValueHud?
    var labelGold: RTLabelValue?
    
    var contentsArray: [RTLabelValueHud] = []
    
    var heroSelected: RTHero = RTHeroWarrior()
    var heroAttributes: RTAttributes = RTAttributes()
    
    var fontSize: CGFloat = 30.0
    
    init(){
        super.init(imageNamed: "topHUD", background: false)
        self.windowPopUp?.anchorPoint = CGPoint(x: 0.0, y: 1.0)
        
        self.userInteractionEnabled = false
        
        self.initContents()
    }
    
    func refreshContents(){
        heroSelected = GHeroesManager!.currentHero
        heroAttributes = GHeroesManager!.currentHero.attributes
        
        self.labelPrimary?.setLabelText(heroAttributes.primaryType.rawValue)
        
        // Array com os atributos e atributos buffs. A ordem tem que respeitar a ordem dos labels do contentArray.
        var attributeArray: [Int] = [heroAttributes.health, heroAttributes.maxHealth, heroAttributes.stamina, heroAttributes.maxStamina, heroAttributes.primary, heroAttributes.primaryBuff, heroAttributes.agility, heroAttributes.agilityBuff, heroAttributes.luck, heroAttributes.luckBuff, heroAttributes.greed, heroAttributes.greedBuff]
        
        for (index, label) in enumerate(contentsArray){
            label.setValues(attributeArray[index], valueAux: attributeArray[index+1])
            label.introAnimation()
            label.refresh()
        }
        
    }
    
    private func initContents(){
        
        heroSelected = GHeroesManager!.currentHero
        heroAttributes = GHeroesManager!.currentHero.attributes
        
        let valueXAlign = self.size.width/5.5
        let valueYAlign = self.size.height/10
        
        // INICIALIZAÇÃO DOS LABEL VALUES
        self.labelHealth = RTLabelValueHud(text: RTAttributes.AttributesEnum.MaxHealth.rawValue, value: heroAttributes.health, valueAux: heroAttributes.maxHealth, fontSize: fontSize + 8, xAlign: valueXAlign * 1.1, stats: false)
        
        self.labelStamina = RTLabelValueHud(text: RTAttributes.AttributesEnum.MaxStamina.rawValue, value: heroAttributes.stamina, valueAux: heroAttributes.maxStamina, fontSize: fontSize + 8, xAlign: valueXAlign * 1.1, stats: false)
        
        self.labelPrimary = RTLabelValueHud(text: RTAttributes.AttributesEnum.Primary.rawValue, value: heroAttributes.primary, valueAux: heroAttributes.primaryBuff, fontSize: fontSize, xAlign: valueXAlign/1.2, stats: true)
        
        self.labelAgility = RTLabelValueHud(text: RTAttributes.AttributesEnum.Agility.rawValue, value: heroAttributes.agility, valueAux: heroAttributes.agilityBuff, fontSize: fontSize, xAlign: valueXAlign/1.2, stats: true)
        
        self.labelLuck = RTLabelValueHud(text: RTAttributes.AttributesEnum.Luck.rawValue, value: heroAttributes.luck, valueAux: heroAttributes.luckBuff, fontSize: fontSize, xAlign: valueXAlign/1.2, stats: true)
        
        self.labelGreed = RTLabelValueHud(text: RTAttributes.AttributesEnum.Greed.rawValue, value: heroAttributes.greed, valueAux: heroAttributes.greedBuff, fontSize: fontSize, xAlign: valueXAlign/1.2, stats: true)
        
        self.labelGold = RTLabelValue(text: RTPlayerManager.PlayerAttributes.Gold.rawValue, value: GPlayerManager.gold, fontSize: fontSize + 12, valueXAlign: valueXAlign/1.2)
        
        
        self.contentsArray = [labelHealth!, labelStamina!, labelPrimary!, labelAgility!, labelLuck!, labelGreed!]
        
        
        
        // Alinhamentos de Coluna e Linha (Relativo)
        let alignColumnA = self.windowPopUp!.size.width/40
        let alignColumnB = self.windowPopUp!.size.width/2.4
        let alignColumnC = self.windowPopUp!.size.width/1.4
        
        let alignRowA = self.windowPopUp!.size.height/4.5
        let alignRowB = self.windowPopUp!.size.height/2.5
        let alignRowC = self.windowPopUp!.size.height/1.7
        let alignRowD = self.windowPopUp!.size.height/1.3
        
        // Arrays com alinhamentos
        let alignColumnArray = [alignColumnA, alignColumnB, alignColumnC]
        let alignRowArray = [alignRowD, alignRowC, alignRowB, alignRowA]
        
        // Conteudo vazio das colunas
        let labelBlank: RTLabelText = RTLabelText(text: "", fontSize: 1, minimum: 1)
        
        // Arrays com conteudo de cada linha / coluna
        let labelArrayRowA = [labelBlank, self.labelGold!, self.labelPrimary!]
        let labelArrayRowB = [self.labelHealth!, labelBlank, self.labelAgility!]
        let labelArrayRowC = [labelBlank, labelBlank, self.labelLuck!]
        let labelArrayRowD = [self.labelStamina!, labelBlank, self.labelGreed!]
        
        // Array de linhas
        let rowArray = [labelArrayRowD, labelArrayRowC, labelArrayRowB, labelArrayRowA]
        
        // Realiza os posicionamentos de todos os nodes de texto.
        for (row, array) in enumerate(rowArray){
            for (column, label) in enumerate(array){
                
                // Se for um label em branco, pula
                if label.fontSize == 1{
                    continue
                }
                
                label.position.x += alignColumnArray[column]
                label.position.y -= alignRowArray[row]
                label.fontColor = SKColor.whiteColor()
                label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
                
                self.windowPopUp!.addChild(label)
                label.introAnimation()
                
            }
        }


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
