//
//  Renderer.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 16/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Renderer: NSObject {
    public static var screenSize: float2 = float2(0,0)
    
    init(_ mtkView: MTKView) {
        super.init()
        updateScreenSize(view: mtkView)
    }
}

extension Renderer: MTKViewDelegate {
    
    public func updateScreenSize(view: MTKView) {
        Renderer.screenSize = float2(Float(view.bounds.width),
                                     Float(view.bounds.height))
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        updateScreenSize(view: view)
    }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        SceneManager.tickScene(renderCommandEncoder: renderCommandEncoder!, deltaTime: 1 / Float(view.preferredFramesPerSecond))

        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
