//
//  RenderPipelineStateLibrary.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 16/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

enum RenderPipelineStateTypes {
    case Basic
}

class RenderPipelineStateLibrary {
    private static var renderPipelineStates: [RenderPipelineStateTypes: RenderPipelineState] = [:]
    
    public static func initialize() {
        createDefaultRenderPipelineState()
    }
    private static func createDefaultRenderPipelineState() {
        renderPipelineStates.updateValue(Basic_RenderPipelineState(), forKey: .Basic)
    }
    public static func pipelineState(_ renderPipelineStateType: RenderPipelineStateTypes) -> MTLRenderPipelineState {
        return renderPipelineStates[renderPipelineStateType]!.renderPipelineState
    }
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState { get }
}

public struct Basic_RenderPipelineState: RenderPipelineState {
    var name: String = "Basic Render Pipeline State"
    var renderPipelineState: MTLRenderPipelineState {
        var renderPipelineState: MTLRenderPipelineState!
        do {
            renderPipelineState = try Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.Basic))
            return renderPipelineState
        } catch let error as NSError {
                 print("ERROR::CREATE::RENDER_PIPELINE_STATE::__\(name)__::\(error)")
        }
        return renderPipelineState
    }
}
