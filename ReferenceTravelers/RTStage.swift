//
//  RTStage.swift
//  ReferenceTravelers
//
<<<<<<< HEAD
//  Created by Bruno de Paula Munhoz on 31/07/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import Foundation

import UIKit
import SpriteKit

class RTStage: RTHideRequired {
    
    var information: String = ""
    var difficulty : String = ""
    
    init(imageNamed imageName:String){
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
    }
    
    //Recebe toques na tela no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
=======
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

class RTStage: RTSelectable {
    var difficulty: RTStage.Difficulty = RTStage.Difficulty.Easy
    var title: String = ""
    var information: String = ""
    
    var backgroundImage: String = ""
    
    enum Difficulty : String{
        case Easy = "EASY BREEZY"
        case Normal = "NORMAL"
        case Hard = "HARDER THAN YOUR HEART"
        case Expert = "REFERENCE EXPERT"
    }
    
    override init(imageNamed imageName:String){
        
        super.init(imageNamed: imageName)
        
        self.imageName = imageName
        
        self.name = "STAGE"
        self.userInteractionEnabled = false

    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
>>>>>>> master
