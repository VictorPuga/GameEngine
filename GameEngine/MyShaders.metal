//
//  MyShaders.metal
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 14/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 basic_vertex_shader(
    device float3 *vertices [[ buffer(0) ]],
    uint vertexID [[vertex_id]]
) {
    return float4(vertices[vertexID], 1);
}

fragment half4 basic_fragment_shader() {
    return half4(1);
}
