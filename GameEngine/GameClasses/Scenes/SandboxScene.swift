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
        debugCamera.position.z = 100
        addCubes()
    }
    
    var cubeCollection: CubeCollection!
    func addCubes() {
        cubeCollection = CubeCollection(cubesWide: 10, cubesHigh: 10, cubesBack: 10)
        addChild(cubeCollection)
    }
    
    override func update(deltaTime: Float) {
        cubeCollection.rotation.z += deltaTime
        super.update(deltaTime: deltaTime)
    }
}
