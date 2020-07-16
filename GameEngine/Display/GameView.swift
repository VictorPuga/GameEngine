//
//  GameView.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 14/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class GameView: MTKView {

    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.device = MTLCreateSystemDefaultDevice()
        
        Engine.Ignite(device: device!)
        
        self.clearColor = Preferences.ClearColor
        self.colorPixelFormat = Preferences.MainPixelFormat
        
        createVertices()
        createBuffers()
    }
    
    func createBuffers()  {
        vertexBuffer = Engine.Device.makeBuffer(
            bytes: vertices,
            length: Vertex.stride(vertices.count),
            options: []
        )
    }
    
    func createVertices() {
        vertices =  [
            Vertex(position: float3( 0,  1, 0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1, -1, 0), color: float4(0,1,0,1)),
            Vertex(position: float3( 1, -1, 0), color: float4(0,0,1,0))
        ]
    }
    
    override func draw(_ rect: NSRect) {
        guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else {return}
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderCommandEncoder?.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(.Basic))
        
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
