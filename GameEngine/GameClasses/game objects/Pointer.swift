//
//  Pointer.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 18/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Pointer: GameObject {
    
    private var camera: Camera!
    init(camera: Camera) {
        super.init(name: "Pointer", meshType: .Triangle_Custom)
        self.camera = camera
    }
    
    override func doUpdate() {
        self.rotateZ(-atan2f(Mouse.getMouseViewportPosition().x - getPositionX() + camera.getPositionX(),
                             Mouse.getMouseViewportPosition().y - getPositionY() + camera.getPositionY()))
        
    }
    
}
