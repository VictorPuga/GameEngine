//
//  Node.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 18/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Node {
    
    var position: SIMD3<Float> = SIMD3<Float>(0, 0, 0)
    var scale: SIMD3<Float> = SIMD3<Float>(1, 1, 1)
    var rotation: SIMD3<Float> = SIMD3<Float>(0, 0, 0)
    
    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        modelMatrix.translate(direction: position)
        modelMatrix.scale(axis: scale)
        modelMatrix.rotate(angle: rotation.x, axis: X_AXIS)
        modelMatrix.rotate(angle: rotation.y, axis: Y_AXIS)
        modelMatrix.rotate(angle: rotation.z, axis: Z_AXIS)
        return modelMatrix
    }
    
    var children: [Node] = []
    
    func addChild(_ child: Node) {
        children.append(child)
    }
    
    func update(deltaTime: Float) {
        for child in children {
            child.update(deltaTime: deltaTime)
        }
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        for child in children {
            child.render(renderCommandEncoder: renderCommandEncoder)
        }
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
}
