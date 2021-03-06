//
//  Entities.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 05/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

class Entities {
    
    private static var _meshLibrary: MeshLibrary!
    public static var meshes: MeshLibrary { return _meshLibrary }
    private static var _textureLibrary: TextureLibrary!
    public static var textures: TextureLibrary { return _textureLibrary }
    
    public static func initialize() {
        self._meshLibrary = MeshLibrary()
        self._textureLibrary = TextureLibrary()
    }
    
}

