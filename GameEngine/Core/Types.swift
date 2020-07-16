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
    static var size: Int {
        return MemoryLayout<Self>.size
    }
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    static var stride: Int {
        return MemoryLayout<Self>.stride
    }
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}

struct Vertex: sizeable {
    var position: float3
    var color: float4
}

extension float3: sizeable { }
