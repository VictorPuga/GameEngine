//
//  Library.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 05/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

class Library<T,K> {
    init() {
        fillLibrary()
    }
    
    func fillLibrary() {
        //Override this function when filling the library with default values
    }
    
    subscript(_ type: T) -> K? {
        return nil
    }
}
