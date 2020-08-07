//
//  Graphics.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 05/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

class Graphics {
    
    private static var _vertexShaderLibrary: VertexShaderLibrary!
    public static var vertexShaders: VertexShaderLibrary { return _vertexShaderLibrary }
    
    private static var _fragmentShaderLibrary: FragmenthaderLibrary!
    public static var fragmentShaders: FragmenthaderLibrary { return _fragmentShaderLibrary }
    
    private static var _vertexDescriptorLibrary: VertexDescriptorLibrary!
    public static var vertexDescriptors: VertexDescriptorLibrary { return _vertexDescriptorLibrary }
    
    private static var _renderPipelineDescriptorLibrary: RenderPipelineDescriptorLibrary!
    public static var renderPipelineDescriptors: RenderPipelineDescriptorLibrary { return _renderPipelineDescriptorLibrary }
    
    private static var _renderPipelineStateLibrary: RenderPipelineStateLibrary!
    public static var renderPipelineStates: RenderPipelineStateLibrary { return _renderPipelineStateLibrary }
    
    private static var _depthStencilStateLibrary: DepthStencilStateLibrary!
    public static var depthStencilStates: DepthStencilStateLibrary { return _depthStencilStateLibrary }
    
    private static var _samplerStateLibrary: SamplerStateLibrary!
    public static var samplerStates: SamplerStateLibrary { return _samplerStateLibrary }
    
    public static func initialize() {
        self._vertexShaderLibrary = VertexShaderLibrary()
        self._fragmentShaderLibrary = FragmenthaderLibrary()
        self._vertexDescriptorLibrary = VertexDescriptorLibrary()
        self._renderPipelineDescriptorLibrary = RenderPipelineDescriptorLibrary()
        self._renderPipelineStateLibrary = RenderPipelineStateLibrary()
        self._depthStencilStateLibrary = DepthStencilStateLibrary()
        self._samplerStateLibrary = SamplerStateLibrary()
    }
}
