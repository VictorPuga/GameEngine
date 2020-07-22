//
//  SandboxScene.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 19/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class SandboxScene: Scene {
    override func buildScene() {
        let count = 5
        for y in -count..<count {
            for x in -count..<count {
                let player = Player()
                player.position.y = Float(Float(y) + 0.5) / Float(count)
                player.position.x = Float(Float(x) + 0.5) / Float(count)
                player.scale = float3(0.1)
                addChild(player)
            }
        }
    }
}
