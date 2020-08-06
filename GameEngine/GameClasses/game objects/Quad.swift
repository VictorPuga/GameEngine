//
//  Quad.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 05/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import simd

class Quad: GameObject {
    
    init() {
        super.init(meshType: .Quad_Custom)
        self.setName("Quad")
    }
}
