//
//  BasicShaders.metal
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 05/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

#include <metal_stdlib>
#include "Shared.metal"
using namespace metal;

vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                          constant ModelConstants &modelConstants [[ buffer(2) ]]){
    RasterizerData rd;
    
    rd.position = sceneConstants.projectionMatrix *
        sceneConstants.viewMatrix *
        modelConstants.modelMatrix *
        float4(vIn.position, 1);
    
    rd.color = vIn.color;
    rd.textureCoordinate = vIn.textureCoordinate;
    rd.totalGameTime = sceneConstants.totalGameTime;
    
    return rd;
}

fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]],
                                     constant Material &material [[ buffer(1) ]],
                                     constant int &lightCount [[ buffer(2) ]],
                                     constant LightData *lightDatas [[ buffer(3) ]],
                                     sampler sampler2d [[ sampler(0) ]],
                                     texture2d<float> texture [[ texture(0) ]]){
    float2 textCoord = rd.textureCoordinate;
    float4 color;
    if (material.useTexture ) {
        color = texture.sample(sampler2d, textCoord);
    }
    else if (material.useMaterialColor) {
        color = material.color;
    }
    else {
        color = rd.color;
    }
    
    if (material.isLit) {
        float3 totalAmbient = float3(0,0,0);
        for (int i = 0; i < lightCount; i++) {
            LightData lightData = lightDatas[i];
            
            float3 ambientness = material.ambient * lightData.ambientIntensity;
            float3 ambientColor = ambientness * lightData.color;
            
            totalAmbient += ambientColor;
        }
        float3 phongIntensity = totalAmbient; // + totalDiffuse + totalSpecular;
        color *= float4(phongIntensity, 1.0);
    }

    return half4(color.r, color.g, color.b, color.a);
}

