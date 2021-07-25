//
//  Player.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 20/07/21.
//

import SpriteKit
import GameplayKit
class Player: GKEntity{
    init(imageName: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        addComponent(spriteComponent)
        //addComponent(ScoreComponent())
        if let sprite = component(ofType: SpriteComponent.self)?.node {
            sprite.physicsBody = SKPhysicsBody(circleOfRadius: 20)
            sprite.physicsBody?.categoryBitMask = 1
            sprite.physicsBody?.contactTestBitMask = 2
            sprite.physicsBody?.collisionBitMask = 2
            sprite.physicsBody?.affectedByGravity = false
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
