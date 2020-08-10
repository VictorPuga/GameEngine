//
//  Sun.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 09/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Sun: LightObject {
    init() {
        super.init(meshType: .Sphere, name: "Sun")
        self.setMaterialColor(SIMD4<Float>(0.5, 0.5 ,0 ,1 ))
        self.setScale(0.3)
    }
}
