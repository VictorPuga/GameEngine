//
//  FragmentShaderLibrary.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 05/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

enum FragmentShaderTypes {
    case Basic
}

class FragmenthaderLibrary: Library<FragmentShaderTypes, MTLFunction> {
    
    private var _library: [FragmentShaderTypes: Shader] = [:]
    
    override func fillLibrary() {
        _library.updateValue(Shader(name: "Basic Fragment Shader",
                                    functionName: "basic_fragment_shader"),
                             forKey: .Basic)
    }
    
    override subscript(_ type: FragmentShaderTypes)->MTLFunction {
        return (_library[type]?.function)!
    }
}
