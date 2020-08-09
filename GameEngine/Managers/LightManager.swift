//
//  LightManager.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 09/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class LightManager {
    private var _lightObjects: [LightObject] = []
    
    func addLightObject(_ lightObject: LightObject) {
        self._lightObjects.append(lightObject)
    }
    
    private func gatherLightData()->[LightData] {
        var result: [LightData] = []
        for lightObject in _lightObjects {
            result.append(lightObject.lightData)
        }
        return result
    }
    
    func setLightData(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        var lightDatas = gatherLightData()
        renderCommandEncoder.setFragmentBytes(&lightDatas,
                                              length: LightData.size(lightDatas.count),
                                              index: 2)
    }
}
