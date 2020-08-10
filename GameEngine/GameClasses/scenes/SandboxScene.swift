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
    var leftSun = Sun()
    var middleSun = Sun()
    var rightSun = Sun()
    
    override func buildScene() {
             debugCamera.setPosition(SIMD3<Float>(0,0,6))
          addCamera(debugCamera)
          
          leftSun.setPosition(SIMD3<Float>(-1, 1, 0))
          leftSun.setMaterialIsLit(false)
          leftSun.setMaterialColor(SIMD4<Float>(1,0,0,1))
          leftSun.setLightColor(SIMD3<Float>(1,0,0))
          addLight(leftSun)
          
          middleSun.setPosition(SIMD3<Float>(0, 1, 0))
          middleSun.setMaterialIsLit(false)
          middleSun.setMaterialColor(SIMD4<Float>(1,1,1,1))
          middleSun.setLightColor(SIMD3<Float>(1,1,1))
          addLight(middleSun)
          
          rightSun.setPosition(SIMD3<Float>( 1, 1, 0))
          rightSun.setMaterialIsLit(false)
          rightSun.setMaterialColor(SIMD4<Float>(0,0,1,1))
          rightSun.setLightColor(SIMD3<Float>(0,0,1))
          addLight(rightSun)
          
          cruiser.setRotationX(0.3)
          addChild(cruiser)
    }
    
    override func doUpdate() {
        if Mouse.isMouseButtonPressed(button: .left) {
            cruiser.rotateX(Mouse.getDY() * GameTime.deltaTime)
            cruiser.rotateY(Mouse.getDX() * GameTime.deltaTime)
        }
    }
    
}
