//
//  Renderable.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 18/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
