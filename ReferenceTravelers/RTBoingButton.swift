//
//  RTBoingButton.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Botão que ao inves de trocar de imagem ao ser pressionado, apenas fica maior, fazendo um BOING, hehe
// Também realiza animação de Idle

class RTBoingButton: RTButton {
    
    override init(imageNamed imageName: String, actionOnTouchBegan: Bool) {
        
        super.init(imageNamed: imageName, actionOnTouchBegan: actionOnTouchBegan)

    }
    
    //Função que troca o texto da label quando pressionado.
    override func setButtonPressed(){
        if buttonPressed{
            self.shrinkAnimation()
        }
        else{
            self.stretchAnimation()
        }
        
        buttonPressed = !buttonPressed
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
