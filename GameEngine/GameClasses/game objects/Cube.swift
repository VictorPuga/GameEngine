//
//  Cube.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 23/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Cube: GameObject {
    
    init(){
        super.init(name: "Cube", meshType: .Cube_Custom)
    }
    
    override func doUpdate() {
        self.rotateX(GameTime.deltaTime)
        self.rotateY(GameTime.deltaTime)
    }
}
