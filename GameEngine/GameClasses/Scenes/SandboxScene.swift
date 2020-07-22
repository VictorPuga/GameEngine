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
    override func buildScene() {
        addCamera(debugCamera)
        let count = 5
        for y in -count..<count {
            for x in -count..<count {
                let pointer = Pointer(camera: debugCamera)
                pointer.position.y = Float(Float(y) + 0.5) / Float(count)
                pointer.position.x = Float(Float(x) + 0.5) / Float(count)
                pointer.scale = SIMD3<Float>(repeating: 0.1)
                addChild(pointer)
            }
        }
    }
}
