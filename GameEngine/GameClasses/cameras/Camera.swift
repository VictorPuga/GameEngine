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

class Camera: Node {
    var cameraType: CameraTypes!
    
    var viewMatrix: matrix_float4x4 {
        var viewMatrix = matrix_identity_float4x4
        viewMatrix.translate(direction: -getPosition())
        return viewMatrix
    }
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_identity_float4x4
    }
    
    init(cameraType: CameraTypes){
        super.init(name: "Camera")
        self.cameraType = cameraType
    }
}
