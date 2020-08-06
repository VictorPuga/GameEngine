//
//  CubeCollection.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 25/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class CubeCollection: InstancedGameObject {
    var cubesWide: Int = 0
    var cubesHigh: Int = 0
    var cubesBack: Int = 0
    
    init(cubesWide: Int, cubesHigh: Int, cubesBack: Int) {
        super.init(meshType: .Cube_Custom, instanceCount: cubesWide * cubesHigh * cubesBack)
        self.cubesWide = cubesWide
        self.cubesHigh = cubesHigh
        self.cubesBack = cubesBack
        self.setName("Cube Collection")

        setColor(ColorUtil.randomColor)
    }
    
    override func doUpdate() {
        let halfWide: Float = Float(cubesWide / 2)
        let halfHigh: Float = Float(cubesHigh / 2)
        let halfBack: Float = Float(cubesBack / 2)
        
        var index: Int = 0
        let gap: Float = cos(GameTime.totalGameTime / 2) * 10
        for y in stride(from: -halfHigh, to: halfHigh, by: 1.0) {
            let posY = Float(y * gap)
            for x in stride(from: -halfWide, to: halfWide, by: 1.0) {
                let posX = Float(x * gap)
                for z in stride(from: -halfBack, to: halfBack, by: 1.0) {
                    let posZ = Float(z * gap)
                    let node = _nodes[index]
                    node.setPosition(SIMD3<Float>(posX, posY, posZ))
                    node.rotate(0, -GameTime.deltaTime * 2, -GameTime.deltaTime * 2)
                    node.setScale(0.3)
                    index += 1
                }
            }
        }
    }
}
