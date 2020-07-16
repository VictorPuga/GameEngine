//
//  Engine.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 15/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Engine {
    
    public static var Device: MTLDevice!
    public static var CommandQueue: MTLCommandQueue!
    
    public static func Ignite(device: MTLDevice) {
        self.Device = device
        self.CommandQueue = device.makeCommandQueue()
        ShaderLibrary.initialize()
        VertexDescriptorLibrary.initialize()
        RenderPipelineDescriptorLibrary.initialize()
        RenderPipelineStateLibrary.initialize()
    }
}
