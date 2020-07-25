//
//  SandboxScene.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 19/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class SandboxScene: Scene {
    var debugCamera = DebugCamera()
    var cube = Cube()
    override func buildScene() {
        addCamera(debugCamera)
        debugCamera.position.z = 13
        addCubes()
    }
    func addCubes() {
        for y in -5..<5 {
            let posY = Float(y) + 0.5
            for x in -8..<8 {
                let posX = Float(x) + 0.5
                let cube = Cube()
                cube.position.y = posY
                cube.position.x = posX
                cube.scale = SIMD3<Float>(repeating: 0.3)
                cube.setColor(ColorUtil.randomColor)
                addChild(cube)
            }
        }
    }
}
