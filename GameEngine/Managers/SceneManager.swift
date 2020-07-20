//
//  SceneManager.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 19/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

enum SceneTypes {
    case Sandbox
}

class SceneManager {
    private static var _currentScene: Scene!
    
    public static func initialize(_ sceneType: SceneTypes) {
        setScene(sceneType)
    }
    
    public static func setScene(_ sceneType: SceneTypes) {
        switch sceneType {
        case .Sandbox:
            _currentScene = SandboxScene()
        }
    }
        
    public static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        _currentScene.update(deltaTime: deltaTime)
        _currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
