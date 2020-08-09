//
//  Cruiser.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 09/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Cruiser: GameObject {
    init() {
        super.init(meshType: .Cruiser)
        setName("Cruiser")
        setTexture(.Cruiser)
    }
}
