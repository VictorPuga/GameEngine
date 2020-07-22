//
//  DebugCamera.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 22/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import simd

class DebugCamera: Camera {
    var cameraType: CameraTypes = .Debug
    var position: float3 = float3(0)
    func update(deltaTime: Float) {
        if Keyboard.isKeyPressed(.leftArrow) {
            position.x -= deltaTime
        }
        if Keyboard.isKeyPressed(.rightArrow) {
            position.x += deltaTime
        }
        if Keyboard.isKeyPressed(.upArrow) {
            position.y += deltaTime
        }
        if Keyboard.isKeyPressed(.downArrow) {
            position.y -= deltaTime
        }
    }
}
