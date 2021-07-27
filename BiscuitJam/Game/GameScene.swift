//
//  GameScene.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 20/07/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var entityManager: EntityManager!

    lazy var player: Player = {
        var player = Player(imageName: "Cupcake")
        if let spriteComponent = player.component(ofType: SpriteComponent.self){
            //spriteComponent.node.position = CGPoint(x: size.width/2, y: size.height/2)

        }
        entityManager.add(player)
        return player
    }()
    
    lazy var timerLabel: SKLabelNode = {
        var timer = self.childNode(withName: "Timer") as! SKLabelNode
        return timer
    }()
    
    lazy var borderBody: SKPhysicsBody = {
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        borderBody.categoryBitMask = 2
        borderBody.restitution = 0
        self.physicsBody = borderBody
        return borderBody
    }()
    
    lazy var cookiePowerUp: SKSpriteNode = {
        let cookiePowerUp = SKSpriteNode(imageNamed: "Cookie")
        cookiePowerUp.physicsBody = SKPhysicsBody(texture: cookiePowerUp.texture!, size: cookiePowerUp.size)
        cookiePowerUp.physicsBody?.categoryBitMask = 4
        cookiePowerUp.physicsBody?.isDynamic = false
        return cookiePowerUp
    }()
    
    
    var Time:Int = 0
    var startTouch = CGPoint()
    var playerPosition = CGPoint()
    var left:Int = 0
    var playerDead:Bool = false
    var ratList = [Rat(imageName: "Rat"), Rat(imageName: "Rat"), Rat(imageName: "Rat"), Rat(imageName: "Rat")]
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        entityManager = EntityManager(scene: self)
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        setupTimer()
        self.physicsBody = borderBody
        addChild(cookiePowerUp)
        setupRats()
    }
    
    //Movement
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !playerDead {
            let touch = touches.first
            if let location = touch?.location(in: self){
                startTouch = location
                left = 0
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !playerDead {
            let touch = touches.first
            if let location = touch?.location(in: self){
                if let spriteComponent = player.component(ofType: SpriteComponent.self){
                    
                    spriteComponent.node.position = CGPoint(x: spriteComponent.node.position.x + (location.x - startTouch.x) * 0.06, y: spriteComponent.node.position.y + (location.y - startTouch.y) * 0.06)
                    if location.x < spriteComponent.node.position.x && left == 0{
                        left = 1
                        spriteComponent.node.xScale = spriteComponent.node.xScale * -1
                    }
                    else if location.x > spriteComponent.node.position.x && left == 1{
                        left = 0
                        spriteComponent.node.xScale = spriteComponent.node.xScale * -1
                    }
                }

            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        left = 0
    }
    
    //Timer
    func setupTimer() {
        timerLabel.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
            self.Time += 1
            self.timerLabel.text = "Time: \(self.Time)"
        }, SKAction.wait(forDuration: 1)])))
        
    }
    func setupPlayer() {
        if let playerNode = player.component(ofType: SpriteComponent.self)?.node {
            playerNode.position = CGPoint(x: size.height/2, y: size.width/2)
        }
    }
    func setupRats() {
        for rat in ratList {
            if let ratNode = rat.component(ofType: SpriteComponent.self) {
                ratNode.node.position = self.frame.randomBorderPoint()
            }
            addChild(rat.component(ofType: SpriteComponent.self)!.node)
            rat.ratMove(within: self.frame)
        }
    }
}

extension GameScene: SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        var lowerBody: SKPhysicsBody
        var upperBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            lowerBody = contact.bodyA
            upperBody = contact.bodyB
        }
        else{
            lowerBody = contact.bodyB
            upperBody = contact.bodyA
        }
        
        if upperBody.categoryBitMask == 4 {
            cookiePowerUp.removeFromParent()
        }
        else if upperBody.categoryBitMask == 8 {
            playerDead = true
            player.component(ofType: SpriteComponent.self)?.node.texture = SKTexture(imageNamed: "CupcakeDead")
        }
    }
}
