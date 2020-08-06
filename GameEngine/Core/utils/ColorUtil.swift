//
//  ColorUtil.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 25/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import simd

class ColorUtil {
    public static var randomColor: SIMD4<Float> {
        return SIMD4<Float>(Float.randomZeroToOne, Float.randomZeroToOne, Float.randomZeroToOne, 1.0)
    }
}
