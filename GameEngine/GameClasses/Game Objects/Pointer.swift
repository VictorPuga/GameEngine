//
//  Player.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 18/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Pointer: GameObject {
    private var camera: Camera!
    init(camera: Camera) {
        super.init(meshType: .Triangle_Custom)
        self.camera = camera
    }
    
    override func update(deltaTime: Float) {
        self.rotation.z = -atan2f(Mouse.getMouseViewportPosition().x - position.x + camera.position.x,
                                  Mouse.getMouseViewportPosition().y - position.y + camera.position.y)
        super.update(deltaTime: deltaTime)
    }
}
