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
    var position: SIMD3<Float> = SIMD3<Float>(0, 0, 0)
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.perspective(degreesFov: 45,
                                           aspectRatio: Renderer.aspectRatio,
                                           near: 0.1,
                                           far: 1000)
    }
    
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
