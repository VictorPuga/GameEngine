//
//  Preferences.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 15/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

public enum ClearColors{
    static let White: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let Green: MTLClearColor = MTLClearColor(red: 0.22, green: 0.55, blue: 0.34, alpha: 1.0)
    static let Grey: MTLClearColor = MTLClearColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    static let Black: MTLClearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let Orange: MTLClearColor = MTLClearColor(red: 1, green: 0.647, blue: 0, alpha: 1)
}

class Preferences {
    public static var ClearColor: MTLClearColor = ClearColors.Orange
    public static var MainPixelFormat: MTLPixelFormat = .bgra8Unorm
}
