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
        var lightCount = lightDatas.count;
        renderCommandEncoder.setFragmentBytes(&lightCount,
                                              length: Float32.size,
                                              index: 2)
        renderCommandEncoder.setFragmentBytes(&lightDatas,
                                              length: LightData.stride(lightCount),
                                              index: 3)
    }
}
