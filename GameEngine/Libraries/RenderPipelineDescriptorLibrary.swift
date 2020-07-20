//
//  RenderPipelineDescriptorLibrary.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 16/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

enum RenderPipelineDescriptorTypes {
    case Basic
}

class RenderPipelineDescriptorLibrary {
    private static var renderPipelineDescriptors: [RenderPipelineDescriptorTypes: RenderPipelineDescriptor] = [:]
    
    public static func initialize() {
        createDefaultRenderPipelineDescriptors()
    }
    private static func createDefaultRenderPipelineDescriptors() {
        renderPipelineDescriptors.updateValue(Basic_RenderPipelineDescriptor(), forKey: .Basic)
    }
    public static func descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorTypes) -> MTLRenderPipelineDescriptor {
        return renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor! { get }
}

public struct Basic_RenderPipelineDescriptor: RenderPipelineDescriptor {
    var name: String = "Basic Render Pipeline Descriptor"
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor!
    
    init() {
        renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.MainPixelFormat
        renderPipelineDescriptor.vertexFunction = ShaderLibrary.vertex(.Basic)
        renderPipelineDescriptor.fragmentFunction = ShaderLibrary.fragment(.Basic)
        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.descriptor(.Basic)
    }
}
