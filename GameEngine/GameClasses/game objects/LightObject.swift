//
//  LightObject.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 09/08/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

class LightObject: GameObject {
    var lightData = LightData()
    
    init(name: String) {
        super.init(meshType: .None)
        self.setName(name)
    }
    
    init(meshType: MeshTypes, name: String) {
        super.init(meshType: meshType)
        self.setName(name)
    }
    
    override func update() {
        self.lightData.position = self.getPosition()
        super.update()
    }
}

extension LightObject {
    // Light color
    public func setLightColor(_ color: SIMD3<Float>) { self.lightData.color = color }
    public func getLightColor() -> SIMD3<Float> { return self.lightData.color }
    
    // Light brightness
    public func setLightBrightness(_ brightness: Float) { self.lightData.brightness = brightness}
    public func getLightBrightness() -> Float { return self.lightData.brightness }
    
    // Ambeint intensity
    public func setAmbientIntensity(_ intensity: Float) { self.lightData.ambientIntensity = intensity }
    public func getAmbientIntensity() -> Float{ return self.lightData.ambientIntensity }
    // Diffuse intensity
    public func setDiffuseIntensity(_ intensity: Float) { self.lightData.diffuseIntensity = intensity }
    public func getDiffuseIntensity() -> Float{ return self.lightData.diffuseIntensity }
    // Specular intensity
    public func setSpecularIntensity(_ intensity: Float) { self.lightData.specularIntensity = intensity }
    public func getSpecularIntensity() -> Float{ return self.lightData.specularIntensity }
}
