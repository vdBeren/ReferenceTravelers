//
//  RTSelectorButton.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 17/7/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit
import SpriteKit

// Classe de um botão seletor, que está selecionado ou não. Troca de imagem ao ser selecionado, e permanece assim até ser des-selecionado.
// Não realiza nenhuma ação, apenas é selecionado ou não. É controlado pelo node pai.
// Necessário que um botão seja iniciado com o nome de sua imagem, e que a imagem pressionado tenha o mesmo nome junto do sufixo ' -t '

class RTSelectorButton: RTHideRequired {
    
    var buttonSelected: Bool = false
    var buttonImageName: String
    
    init (imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        buttonImageName = imageName
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "SELECTORBUTTON"
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.userInteractionEnabled = true
        
    }
    
    func isSelected() -> Bool{
        return buttonSelected
    }
    
    //Função que troca a imagem do botão para sua imagem de tocado.
    func setButtonSelected(){
        if buttonSelected{
            self.texture = SKTexture(imageNamed: buttonImageName)
        }
        else{
            self.texture = SKTexture(imageNamed: buttonImageName + "-t")
        }
        
        buttonSelected = !buttonSelected
    }
    
    //Recebe toques no Node.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if !buttonSelected{
            (self.parent as? RTGamePad)?.selectorControl()
        }
 
        
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
