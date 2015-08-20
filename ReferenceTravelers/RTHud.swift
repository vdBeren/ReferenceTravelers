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
    
    var heroSelected: RTHero = RTHeroWarrior()
    var heroAttributes: RTAttributes = RTAttributes()
    
    var fontSize: CGFloat = 30.0
    
    init(){
        super.init(imageNamed: "windowText", background: false)
        self.windowPopUp?.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    }
    
    private func initContents(){
        
        heroSelected = GHeroesManager!.currentHero
        heroAttributes = GHeroesManager!.currentHero.attributes
        
        let valueXAlign = self.size.width/5.5
        let valueYAlign = self.size.height/10
        
        // INICIALIZAÇÃO DOS LABEL VALUES
        self.labelHealth = RTLabelValueHud(text: RTAttributes.AttributesEnum.MaxHealth.rawValue, value: heroAttributes.health, valueAux: heroAttributes.maxHealth, fontSize: fontSize + 12, xAlign: valueXAlign)
        
        self.labelStamina = RTLabelValueHud(text: RTAttributes.AttributesEnum.MaxStamina.rawValue, value: heroAttributes.stamina, valueAux: heroAttributes.maxStamina, fontSize: fontSize + 12, xAlign: valueXAlign)
        
        self.labelPrimary = RTLabelValueHud(text: RTAttributes.AttributesEnum.Primary.rawValue, value: heroAttributes.primary, valueAux: heroAttributes.primary, fontSize: fontSize, xAlign: valueXAlign)
        
        self.labelAgility = RTLabelValueHud(text: RTAttributes.AttributesEnum.Agility.rawValue, value: heroAttributes.agility, valueAux: heroAttributes.agility, fontSize: fontSize, xAlign: valueXAlign)
        
        self.labelLuck = RTLabelValueHud(text: RTAttributes.AttributesEnum.Luck.rawValue, value: heroAttributes.luck, valueAux: heroAttributes.luck, fontSize: fontSize, xAlign: valueXAlign)
        
        self.labelGreed = RTLabelValueHud(text: RTAttributes.AttributesEnum.Greed.rawValue, value: heroAttributes.greed, valueAux: heroAttributes.greed, fontSize: fontSize, xAlign: valueXAlign)
        
        self.labelGold = RTLabelValue(text: RTPlayerManager.PlayerAttributes.Gold.rawValue, value: GPlayerManager.gold, fontSize: fontSize + 12, valueXAlign: valueXAlign, valueYAlign: valueYAlign)
        

        
        // Alinhamentos de Coluna e Linha (Relativo)
        let alignColumnA = self.windowPopUp!.size.width/20
        let alignColumnB = self.windowPopUp!.size.width/3.6
        let alignColumnC = self.windowPopUp!.size.width/1.35
        let alignColumnD = self.windowPopUp!.size.width/1.11
        
        let alignRowA = self.windowPopUp!.size.height/1.25
        let alignRowB = self.windowPopUp!.size.height/2.0
        
        // Arrays com alinhamentos
        let alignColumnArray = [alignColumnA, alignColumnB, alignColumnC, alignColumnD]
        let alignRowArray = [alignRowA, alignRowB]
        
        // Conteudo vazio das colunas
        let labelBlank: RTLabelText = RTLabelText(text: "", fontSize: 1, minimum: 1)
        let labelBlank2: RTLabelText = RTLabelText(text: "", fontSize: 1, minimum: 1)
        
        // Arrays com conteudo de cada linha / coluna
        let labelArrayRowA = [self.labelHealth!, self.labelGold!, self.labelPrimary!, labelAgility!]
        let labelArrayRowB = [self.labelStamina!, labelBlank, self.labelLuck!, self.labelGreed!]
        
        // Array de linhas
        let rowArray = [labelArrayRowA, labelArrayRowB]
        
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


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
