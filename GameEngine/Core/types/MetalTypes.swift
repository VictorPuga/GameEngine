//
//  Types.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 15/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import simd

protocol sizeable { }
extension sizeable {
    static var size: Int{
        return MemoryLayout<Self>.size
    }
    
    static var stride: Int{
        return MemoryLayout<Self>.stride
    }
    
    static func size(_ count: Int)->Int{
        return MemoryLayout<Self>.size * count
    }
    
    static func stride(_ count: Int)->Int{
        return MemoryLayout<Self>.stride * count
    }
}

extension Int32: sizeable { }
extension Float: sizeable { }
extension SIMD2: sizeable { }
extension SIMD3: sizeable { }
extension SIMD4: sizeable { }

struct Vertex: sizeable {
    var position: SIMD3<Float>
    var color: SIMD4<Float>
    var textureCoordinate: SIMD2<Float>
    var normal: SIMD3<Float>
}

struct ModelConstants: sizeable {
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants: sizeable {
    var totalGameTime: Float = 0
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
    var cameraPosition = SIMD3<Float>(repeating: 0)
}

struct Material: sizeable {
    var color = SIMD4<Float>(0.8, 0.8, 0.8, 1.0)
    var useMaterialColor: Bool = false
    var useTexture: Bool = false
    var isLit: Bool = true
    var ambient: SIMD3<Float> = SIMD3<Float>(repeating: 0.1)
    var diffuse: SIMD3<Float> = SIMD3<Float>(repeating: 1)
    var specular: SIMD3<Float> = SIMD3<Float>(repeating: 1)
    var shininess: Float = 2
}

struct LightData: sizeable {
    var position: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    var color: SIMD3<Float> = SIMD3<Float>(repeating: 1)
    var brightness: Float = 1
    var ambientIntensity: Float = 1
    var diffuseIntensity: Float = 1
    var specularIntensity: Float = 1
}
