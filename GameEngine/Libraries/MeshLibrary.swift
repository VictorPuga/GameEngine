//
//  MeshLibrary.swift
//  GameEngine
//
//  Created by Victor Manuel Puga Ruiz on 18/07/20.
//  Copyright © 2020 Ampersand Labs. All rights reserved.
//

import MetalKit

enum MeshTypes {
    case Triangle_Custom
    case Quad_Custom
}

class MeshLibrary {
    private static var meshes : [MeshTypes: Mesh] = [:]
    
    public static func initialize() {
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes() {
        meshes.updateValue(Triangle_CustomMesh(), forKey: .Triangle_Custom)
        meshes.updateValue(Quad_CustomMesh(), forKey: .Quad_Custom)
    }
    
    public static func mesh(_ meshType: MeshTypes) -> Mesh {
        return meshes[meshType]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        return vertices.count
    }
    
    init() {
        createVertices()
        createBuffers()
    }
    
    func createBuffers()  {
        vertexBuffer = Engine.Device.makeBuffer(
            bytes: vertices,
            length: Vertex.stride(vertexCount),
            options: []
        )
    }
    func createVertices() {}
}

class Triangle_CustomMesh: CustomMesh {
    override func createVertices() {
        vertices =  [
            Vertex(position: float3( 0,  1, 0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1, -1, 0), color: float4(0,1,0,1)),
            Vertex(position: float3( 1, -1, 0), color: float4(0,0,1,1))
        ]
    }
}

class Quad_CustomMesh: CustomMesh {
    override func createVertices() {
        vertices =  [
            Vertex(position: float3( 1,  1, 0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1,  1, 0), color: float4(0,1,0,1)),
            Vertex(position: float3(-1, -1, 0), color: float4(0,0,1,1)),
            
            Vertex(position: float3( 1,  1, 0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1, -1, 0), color: float4(0,0,1,1)),
            Vertex(position: float3( 1, -1, 0), color: float4(1,0,1,1))
        ]
    }
}

