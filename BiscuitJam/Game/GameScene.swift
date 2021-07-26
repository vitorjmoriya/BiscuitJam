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
            spriteComponent.node.size = CGSize(width: 20, height: 20)

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
//    let humanCastle = Castle(imageName: "castle1_atk")
//    if let spriteComponent = humanCastle.component(ofType: SpriteComponent.self) {
//      spriteComponent.node.position = CGPoint(x: spriteComponent.node.size.width/2, y: size.height/2)
//    }
//    entityManager.add(humanCastle)
    var Time:Int = 0
    var startTouch = CGPoint()
    var playerPosition = CGPoint()
    //var cupcake = SKSpriteNode(imageNamed: "Rat")
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        entityManager = EntityManager(scene: self)
        //cupcake = self.childNode(withName: "cupcake") as! SKSpriteNode
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        //cupcake.physicsBody?.applyImpulse(CGVector(dx: 6, dy: 6))
        setupTimer()
        self.physicsBody = borderBody
        //blindRatMove(within: self.frame)
        //let rat = BlindRat(imageName: "Rat")
        let rat = Rat(imageName: "Rat")
        //rat.ratMove(within: self.frame)
        rat.ratMove(within: self.frame)
        addChild(rat.component(ofType: SpriteComponent.self)!.node)
        //ratMove(within: self.frame)
    }
    
    //Movement
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self){
            startTouch = location
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self){
            if let spriteComponent = player.component(ofType: SpriteComponent.self){
                spriteComponent.node.position = CGPoint(x: spriteComponent.node.position.x + (location.x - startTouch.x) * 0.06, y: spriteComponent.node.position.y + (location.y - startTouch.y) * 0.06)
            }

        }
    }
    
    //Timer
    func setupTimer() {
        timerLabel.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
            self.Time += 1
            self.timerLabel.text = "Time: \(self.Time)"
        }, SKAction.wait(forDuration: 1)])))
        
    }
    func setupPlayer(){
        if let playerNode = player.component(ofType: SpriteComponent.self)?.node {
            playerNode.position = CGPoint(x: size.height/2, y: size.width/2)
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
        
        if upperBody.categoryBitMask == 2 {
            print("bateu")
            
        }
    }
}
