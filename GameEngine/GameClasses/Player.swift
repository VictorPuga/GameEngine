//
//  Player.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 18/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Player: GameObject {
    init() {
        super.init(meshType: .Triangle_Custom)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.z = -atan2f(Mouse.getMouseViewportPosition().x - position.x,
                                  Mouse.getMouseViewportPosition().y - position.y)
        super.update(deltaTime: deltaTime)
    }
}
