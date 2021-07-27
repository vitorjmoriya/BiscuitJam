//
//  Rat.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 20/07/21.
//

import SpriteKit

//protocol Rat: SKSpriteNode {
//    func move()
//}

import SpriteKit
import GameplayKit

// 1
class Rat: GKEntity {
    

    init(imageName: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        spriteComponent.node.physicsBody = SKPhysicsBody(texture: spriteComponent.node.texture!, size: spriteComponent.node.size)
        spriteComponent.node.physicsBody?.categoryBitMask = 8
        spriteComponent.node.physicsBody?.contactTestBitMask = 1
        spriteComponent.node.physicsBody?.collisionBitMask = 0
        
        addComponent(spriteComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func ratMove(within rect:CGRect){
        
        let point = rect.randomBorderPoint()

        //Go randomly around the screen within view bounds
        //Formula: time = distance / speed
        let duration = TimeInterval(point.distance(point: (self.component(ofType: SpriteComponent.self)?.node.position)!) / 100)
        let angle = atan2(point.y - (self.component(ofType: SpriteComponent.self)?.node.position.y)!, point.x - (self.component(ofType: SpriteComponent.self)?.node.position.x)!)
        self.component(ofType: SpriteComponent.self)?.node.zRotation = angle - CGFloat(Double.pi/2)
        let move = SKAction.move(to: point, duration: duration)
        let block = SKAction.run {
            self.ratMove(within: rect)
        }
        let loop = SKAction.sequence([move,block])
        self.component(ofType: SpriteComponent.self)?.node.run(loop)
    }
    func ratStop() {
        //self.component(ofType: SpriteComponent.self)?.node.removeAllActions()
        self.component(ofType: SpriteComponent.self)?.node.isPaused = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.component(ofType: SpriteComponent.self)?.node.isPaused = false
        }
    }
}
