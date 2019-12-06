//
//  CGVector+OctopusKit.swift
//  OctopusKit
//
//  Created by ShinryakuTako@invadingoctopus.io on 2017/11/11.
//  Copyright © 2019 Invading Octopus. Licensed under Apache License v2.0 (see LICENSE.txt)
//

// TODO: Tests

// CREDIT: https://github.com/raywenderlich/SKTUtils/blob/master/SKTUtils/CGVector%2BExtensions.swift

import CoreGraphics
import SpriteKit

public extension CGVector {

    // MARK: - Initializers
    
    /// Converts a `CGPoint` to `CGVector`.
    init(_ point: CGPoint) {
        self.init(dx: point.x,
                  dy: point.y)
    }
    
    /// Converts a `SIMD2<Float>` to `CGVector`.
    init(_ point: SIMD2<Float>) {
        self.init(dx: CGFloat(point.x),
                  dy: CGFloat(point.y))
    }
    
    /// Creates a vector of length `1.0` with the specified angle in radians.
    ///
    /// An angle of `0` is assumed to point to the right.
    init(radians: CGFloat) {
        self.init(dx: cos(radians), dy: sin(radians))
    }
    
    // MARK: - Common Tasks
    
    // MARK: Type Methods
    
    /// Performs a linear interpolation between two `CGVector`s.
    @inlinable
    static func lerp(start: CGVector, end: CGVector, t: CGFloat) -> CGVector {
        // TODO: Explain `t`
        start + (end - start) * t
    }
    
    // MARK: Instance Properties
    
    /// Returns the length (magnitude) of this vector.
    @inlinable
    var length: CGFloat {
        sqrt(dx * dx + dy * dy)
    }
    
    /// Returns the squared length (magnitude) of this vector
    @inlinable
    var lengthSquared: CGFloat {
        (dx * dx) + (dy * dy)
    }
    
    /// Returns the angle of this vector in radians. The range of the angle is `-π` to `π`.
    ///
    /// An angle of `0` is assumed to point to the right.
    @inlinable
    var angle: CGFloat {
        atan2(dy, dx)
    }
    
    // MARK: Instance Methods
    
    /// Calculates the distance between two `CGVectors`. Pythagoras!
    @inlinable
    func distance(to vector: CGVector) -> CGFloat {
        (self - vector).length
    }
    
    /// Normalizes this vector to a length of `1.0` and returns the result as a new `CGVector`.
    @inlinable
    func normalized() -> CGVector {
        let length = self.length
        return length > 0 ? self / length : CGVector.zero
    }
    
    /// Normalizes this vector to a length of `1.0`.
    @inlinable
    mutating func normalize() {
        self = normalized()
    }
    
    /// Limits the magnitude of `dx` and `dy` to the absolute (unsigned) value of `max`.
    @inlinable
    mutating func clampMagnitude(to max: CGFloat) {
        
        // If we just want zero magnitude, there isn't much to do.
        
        if  max == 0 {
            self.dx = 0
            self.dy = 0
            return
        }
        
        // Get the absolute (unsigned) value of `max`, limit `dx` and `dy` to that if they're not zero, then finally restore their signs.
        
        let max = abs(max)
        
        if  dx != 0 && abs(dx) > max {
            let xSignum: CGFloat = dx >= 0 ? 1 : -1
            dx = max
            dx *= xSignum
        }
        
        if  dy != 0 && abs(dy) > max {
            let ySignum: CGFloat = dy >= 0 ? 1 : -1
            dy = max
            dy *= ySignum
        }
    }
    
    // MARK: - Operators
    
    /// Adds two vectors and returns the result as a new `CGVector`.
    @inlinable
    static func + (left: CGVector, right: CGVector) -> CGVector {
        CGVector(dx: left.dx + right.dx,
                 dy: left.dy + right.dy)
    }
    
    /// Adds two vectors, storing the result in the left vector.
    @inlinable
    static func += (left: inout CGVector, right: CGVector) {
        left = left + right
    }
    
    /// Subtracts two vectors and returns the result as a new `CGVector`.
    @inlinable
    static func - (left: CGVector, right: CGVector) -> CGVector {
        CGVector(dx: left.dx - right.dx,
                 dy: left.dy - right.dy)
    }
    
    /// Subtracts the right vector from the left vector, storing the result in the left vector.
    @inlinable
    static func -= (left: inout CGVector, right: CGVector) {
        left = left - right
    }
    
    /// Multiplies two vectors and returns the result as a new `CGVector`.
    @inlinable
    static func * (left: CGVector, right: CGVector) -> CGVector {
        CGVector(dx: left.dx * right.dx,
                 dy: left.dy * right.dy)
    }
    
    /// Multiplies the vector with another, storing the result in the left vector.
    @inlinable
    static func *= (left: inout CGVector, right: CGVector) {
        left = left * right
    }
    
    /// Multiplies a vector with a scalar value and returns the result as a new `CGVector`.
    @inlinable
    static func * (vector: CGVector, scalar: CGFloat) -> CGVector {
        CGVector(dx: vector.dx * scalar,
                 dy: vector.dy * scalar)
    }
    
    /// Multiplies the vector with a scalar, storing the result in the vector.
    @inlinable
    static func *= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector * scalar
    }
    
    /// Divides two vectors and returns the result as a new `CGVector`.
    @inlinable
    static func / (left: CGVector, right: CGVector) -> CGVector {
        CGVector(dx: left.dx / right.dx,
                 dy: left.dy / right.dy)
    }
    
    /// Divides the left vector by the right vector, storing the result in the left vector.
    @inlinable
    static func /= (left: inout CGVector, right: CGVector) {
        left = left / right
    }
    
    /// Divides a vector by a scalar value and returns the result as a new `CGVector`.
    @inlinable
    static func / (vector: CGVector, scalar: CGFloat) -> CGVector {
        CGVector(dx: vector.dx / scalar,
                 dy: vector.dy / scalar)
    }
    
    /// Divides the vector by a scalar, storing the result in the vector.
    @inlinable
    static func /= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector / scalar
    }
    
}
