//
//  GameScene.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 20/07/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    lazy var player: SKSpriteNode = {
        var player = self.childNode(withName: "Player") as! SKSpriteNode
        return player
    }()
    
    var startTouch = CGPoint()
    var playerPosition = CGPoint()
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.physicsWorld.contactDelegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self){
            startTouch = location
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self){
            player.position = CGPoint(x: player.position.x + (location.x - startTouch.x) * 0.06, y: player.position.y + (location.y - startTouch.y) * 0.06)
        }
    }
    override func update(_ currentTime: TimeInterval) {
        
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
        print("bateu")
        if lowerBody.categoryBitMask == 1 {
//            var label = SKLabelNode(text: "teste")
//            label.position.x = 50
//            label.position.y = 50
//            label.color = UIColor.white
//            addChild(label)
            
        }
    }
}
