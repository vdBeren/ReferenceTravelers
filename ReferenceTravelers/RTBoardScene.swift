//
//  RTBoardScene.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 13/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit


class RTBoardScene: SKScene {
    
    var boardTiles: [RTTile] = []
    var eventWindow: RTEventWindow?
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        //Background da Scene
        backgroundNode = RTBackground(imageNamed: "bg0")
        backgroundNode!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(backgroundNode!)
        
        eventWindow = RTEventWindow(imageNamed: "EventWindow")
        addChild(eventWindow!)
        
        
    }
    
    //Chamado a todo frame. Usado para realizar o update dos nodes da Scene, em cascata.
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
    }
    
    
    //Recebe toques na Scene.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
