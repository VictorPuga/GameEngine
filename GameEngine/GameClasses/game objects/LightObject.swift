//
//  LightObject.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 09/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class LightObject: GameObject {
    var lightData = LightData()
    
    init(name: String) {
        super.init(meshType: .None)
        self.setName(name)
    }
    
    init(meshType: MeshTypes, name: String) {
        super.init(meshType: meshType)
        self.setName(name)
    }
    
    override func update() {
        self.lightData.position = self.getPosition()
        super.update()
    }
}
