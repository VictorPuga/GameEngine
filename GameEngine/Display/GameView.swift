//
//  GameView.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 14/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class GameView: MTKView {
    
    var renderer: Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.device = MTLCreateSystemDefaultDevice()
        
        Engine.Ignite(device: device!)
        
        self.clearColor = Preferences.ClearColor
        self.colorPixelFormat = Preferences.MainPixelFormat
        
        self.renderer = Renderer()
        self.delegate = renderer
    }
}
