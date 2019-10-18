//
//  NodeSpawnerComponent.swift
//  OctopusKitQuickStart
//
//  Created by ShinryakuTako@invadingoctopus.io on 2019/10/17.
//  Copyright © 2019 Invading Octopus. Licensed under Apache License v2.0 (see LICENSE.txt)
//

import SpriteKit
import GameplayKit
import OctopusKit

/// A demonstration component that creates 2 sprites, then adds them to the entity's node at the touched position on every frame.
///
/// A random emoji `SKLabelNode` with physics and an animated "spinny" `SKShapeNode` like the one in the Xcode SpriteKit game project template. :)
final class NodeSpawnerComponent: OctopusComponent, OctopusUpdatableComponent {
    
    private var spinnyNode: SKShapeNode?
    private var emojiNode: SKLabelNode?
    
    private var nodesSpawnedInContiguousFrames = 0
    private var touchedFramesCount = 0
    
    override func didAddToEntity(withNode node: SKNode) {
        
        guard let nodeSize = (node as? SKNodeWithDimensions)?.size else { return }
        
        // Create an initial spinny here that will be copied later, because we can conveniently access the parent node's dimensions in this method.
        
        let w = (nodeSize.width + nodeSize.height) * CGFloat(0.05)
        
        self.spinnyNode = SKShapeNode(rectOf: CGSize(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(
                .repeatForever(
                    .rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            
            spinnyNode.run(
                .sequence([
                    .wait(forDuration: 0.5),
                    .fadeOut(withDuration: 0.5),
                    .removeFromParent()]))
        }
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
        if nodesSpawnedInContiguousFrames > 0 { nodesSpawnedInContiguousFrames -= 1 }
        
        guard
            let node = entityNode,
            let touchEventComponent = coComponent(TouchEventComponent.self),
            let touch = touchEventComponent.touches.first
            else { return }
        
        if let spinny = self.spinnyNode?.copy() as? SKShapeNode
        {
            spinny.position = touch.location(in: node)
            spinny.strokeColor = SKColor.blue
            spinny.zPosition = -20
            node.addChild(spinny)
        }
        
        if touchedFramesCount == 0 || touchedFramesCount.isMultiple(of: 2) {
            let emojiNode = createRandomEmojiNode(position: touch.location(in: node))
            node.addChild(emojiNode)
        }
        
        touchedFramesCount += 1
        
        if touchedFramesCount >= Int.max - 10 { touchedFramesCount = 0 } // :)
    }
    
    func createRandomEmojiNode(position: CGPoint) -> SKLabelNode {
        
        let emojis = "🐙👾🕹🚀🎮📱⌚️💿📀🧲🧿🎲🧩🎨🎸⚽️🎱🍖🍑🍆🍩🍌⭐️🌈🌸🌺🌼🐹🦊🐼🐱🐶"
        let randomEmoji = String(emojis.randomElement()!)
        
        let emojiNode = SKLabelNode(text: randomEmoji)
        
        emojiNode.fontSize = 32
        emojiNode.position = position
        emojiNode.zPosition = -10

        emojiNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(widthAndHeight: 30))
        
        let randomAdjustment = CGVector(dx: CGFloat(Int.random(in: -40 ... 40)),
                                  dy: CGFloat(Int.random(in: -10 ... 25)))
        
        emojiNode.position.x += randomAdjustment.dx
        emojiNode.position.y += randomAdjustment.dy
        
        let randomForce = CGVector(dx: randomAdjustment.dx / 3,
                                   dy: CGFloat(Int.random(in: 15 ... 25)))
            
        emojiNode.run(
            .sequence([
                .applyImpulse(randomForce, duration: 0.1),
                .wait(forDuration: 3.0),
                .fadeOut(withDuration: 0.5),
                .removeFromParent()]))
            
        return emojiNode
    }
    
}
