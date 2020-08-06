//
//  RenderPipelineStateLibrary.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 05/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

enum RenderPipelineStateTypes {
    case Basic
    case Instanced
}

class RenderPipelineStateLibrary: Library<RenderPipelineStateTypes, MTLRenderPipelineState> {
    
    private var _library: [RenderPipelineStateTypes: RenderPipelineState] = [:]
    
    override func fillLibrary() {
        _library.updateValue(RenderPipelineState(renderPipelineDescriptorType: .Basic), forKey: .Basic)
        _library.updateValue(RenderPipelineState(renderPipelineDescriptorType: .Instanced), forKey: .Instanced)
    }
    
    override subscript(_ type: RenderPipelineStateTypes)->MTLRenderPipelineState {
        return _library[type]!.renderPipelineState
    }
    
}

class RenderPipelineState {
    
    var renderPipelineState: MTLRenderPipelineState!
    init(renderPipelineDescriptorType: RenderPipelineDescriptorTypes) {
        do{
            renderPipelineState = try Engine.Device.makeRenderPipelineState(descriptor: Graphics.renderPipelineDescriptors[renderPipelineDescriptorType])
        }catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__::\(error)")
        }
    }
    
}
