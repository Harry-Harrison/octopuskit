//
//  SKNodeWithDimensions.swift
//  OctopusKit
//
//  Created by ShinryakuTako@invadingoctopus.io on 2018/03/18.
//  Copyright © 2020 Invading Octopus. Licensed under Apache License v2.0 (see LICENSE.txt)
//

import SpriteKit

/// A protocol for types that have `width` and `height` properties.
///
/// Useful for passing around `SKNode`-based classes to functions that need to work with width or height.
public protocol SKNodeWithDimensions { // where Self: SKNode { // ⚠️ Crashes.
    // TODO: Change name to an adjective?
    var size: CGSize { get }
}

// NOTE: `public' modifier cannot be used with extensions that declare protocol conformances :)

extension SKCameraNode: SKNodeWithDimensions {
    
    /// Returns the `size` of the parent (scene.)
    public var size: CGSize {
        // TODO: Verify and check compatibility with scaling etc.
        if  let parent = self.parent as? SKNodeWithDimensions {
            return parent.size
        } else {
            return CGSize.zero
        }
    }
}

extension SKScene:          SKNodeWithDimensions {}

extension SKSpriteNode:     SKNodeWithDimensions {}

extension SKTileMapNode:    SKNodeWithDimensions {
    public var size: CGSize { self.mapSize }
}

extension SKVideoNode:      SKNodeWithDimensions {}
