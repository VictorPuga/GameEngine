//
//  SandboxScene.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 19/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class SandboxScene: Scene{
    
    var debugCamera = DebugCamera()
    var cruiser = Cruiser()
    var sun = Sun()
    
    override func buildScene() {
        addCamera(debugCamera)
        sun.setPosition(SIMD3<Float>(0,2,2))
        addLight(sun)
        
        debugCamera.setPositionZ(5)
        addChild(cruiser)
    }
    
    override func doUpdate() {
        if Mouse.isMouseButtonPressed(button: .left) {
            cruiser.rotateX(Mouse.getDY() * GameTime.deltaTime)
            cruiser.rotateY(Mouse.getDX() * GameTime.deltaTime)
        }
    }
    
}
