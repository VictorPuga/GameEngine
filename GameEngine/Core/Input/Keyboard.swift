//
//  Keyboard.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 21/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

class Keyboard {
    private static var KEY_COUNT: Int = 256
    private static var keys = [Bool].init(repeating: false, count: KEY_COUNT)
    
    public static func setKeyPressed(_ keyCode: UInt16, isOn: Bool) {
        keys[Int(keyCode)] = isOn
    }
    
    public static func isKeyPressed(_ keyCode: KeyCode)->Bool{
        return keys[Int(keyCode.rawValue)]
    }
    
}
