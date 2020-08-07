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
    var quad = Quad()
    override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.setPositionZ(5)
        quad.setTexture(.PartyPirateParot)
        addChild(quad)
    }
    
    override func doUpdate() {
        quad.rotateY(GameTime.deltaTime)
    }
    
}
