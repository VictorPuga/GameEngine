//
//  Node.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 18/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class Node {
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
}
