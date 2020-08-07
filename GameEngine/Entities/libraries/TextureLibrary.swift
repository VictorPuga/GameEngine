//
//  TextureLibrary.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 07/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

enum TextureTypes {
    case None
    case PartyPirateParot
}

class TextureLibrary: Library<TextureTypes, MTLTexture> {
    private var library: [TextureTypes: Texture] = [:]
    
    override func fillLibrary() {
        library.updateValue(Texture("PartyPirateParot"), forKey: .PartyPirateParot)
    }
    override subscript(type: TextureTypes) -> MTLTexture? {
        return library[type]?.texture
    }
}

class Texture {
    var texture: MTLTexture!
    
    init(_ textureName: String, ext: String = "png", origin: MTKTextureLoader.Origin = .topLeft) {
        let textureLoader = TextureLoader(textureName: textureName, textureExtension: ext, origin: origin)
        let texture: MTLTexture = textureLoader.loadTextureFromBundle()
        setTexture(texture)
    }
    func setTexture(_ texture: MTLTexture) {
        self.texture = texture
    }
}

public enum TextureOrigin {
    case TopLeft
    case BottomLeft
}

class TextureLoader {
    private var _textureName: String!
    private var _textureExtension: String!
    private var _origin: MTKTextureLoader.Origin!
    
    init(textureName: String, textureExtension: String = "png", origin: MTKTextureLoader.Origin = .topLeft) {
        self._textureName = textureName
        self._textureExtension = textureExtension
        self._origin = origin
        print(self._origin!)
    }
    
    public func loadTextureFromBundle() -> MTLTexture {
        var result: MTLTexture!
        if let url = Bundle.main.url(forResource: _textureName, withExtension: _textureExtension) {
            let textureLoader = MTKTextureLoader(device: Engine.Device)
            
            let options: [MTKTextureLoader.Option: Any] = [MTKTextureLoader.Option.origin: _origin!]
            
            do {
                result = try textureLoader.newTexture(URL: url, options: options)
                result.label = _textureName
            }
            catch let error as NSError {
                print("ERROR::CREATING::TEXTURE::__\(_textureName!)__::\(error)")
            }
        }
        else {
            print("ERROR::CREATING::TEXTURE::__\(_textureName!)__ does not exist")
        }
        
        return result
    }
}
