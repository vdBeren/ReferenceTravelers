//
//  RTStageManager.swift
//  ReferenceTravelers
//
//  Created by Victor D. Savariego on 2/8/15.
//  Copyright (c) 2015 RTTeam. All rights reserved.
//

import UIKit

class RTStageManager: NSObject {
    
    var stageArray: [RTStage] = []
    var currentStage: RTStage = RTStageMedieval()
    
    override init(){
        
        super.init()
        
        sortStages()
    }
    
    private func sortStages(){
        let stageMedieval = RTStageMedieval()
        let stageSciFi = RTStageSciFi()
        let stageAngelGrove = RTStageAngelGrove()
        
        let arrayStages = [stageMedieval, stageSciFi, stageAngelGrove]
        
        for stage in arrayStages{
            stageArray.append(stage)
        }
    }

}
