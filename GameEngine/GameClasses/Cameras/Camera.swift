//
//  Camera.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 22/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import simd

enum CameraTypes {
    case Debug
}

protocol Camera {
    var cameraType: CameraTypes { get }
    var position: float3 { get set }
    func update(deltaTime: Float)
}

extension Camera {
    var viewMatrix: matrix_float4x4 {
        var viewMatrix = matrix_identity_float4x4
        viewMatrix.translate(direction: -position)
        return viewMatrix
    }
}
