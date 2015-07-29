//
//  RTLabel.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 25/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTLabel: SKLabelNode {
    
    var finalText: NSString = ""
    
    init(text: String){
        super.init()
        
        self.name = "LABEL"
        self.fontName = "Arial"
        
        self.fontSize = 22
        self.fontColor = SKColor.whiteColor()
        self.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        self.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        
        self.finalText = text
        
    }
    
    func introAnimation(){
        
        
        let actionBlock = SKAction.runBlock({
            let textLen = self.checkMinimum(self.finalText.length - 15)
            
            self.text = self.randomStringWithLength(textLen) as String
        
        })
        let wait = SKAction.waitForDuration(0.05, withRange: 0.10)
        var sequence = SKAction.sequence([actionBlock, wait])
        
        let repeat = SKAction.repeatAction(sequence, count: 16)
        let finalTextBlock = SKAction.runBlock({self.text = self.finalText as String})
        let sequenceFinal = SKAction.sequence([repeat, finalTextBlock])
        
        self.runAction(sequenceFinal)
    }
    
    
    func randomStringWithLength (len: Int) -> NSString {
        
        let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%ˆ&*()-_=+<>?/"
        
        var randomString: NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString
    }
    
    func checkMinimum(value: Int) -> Int{
        let min = 10
        if value < min{
            return min
        }
        
        return value
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
