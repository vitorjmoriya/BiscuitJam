//
//  GameScene.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 20/07/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player = SKSpriteNode()
    var startTouch = CGPoint()
    var playerPosition = CGPoint()
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.player = self.childNode(withName: "Player") as! SKSpriteNode
        
    }
    var lastTouch:CGPoint? = nil
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //player.position = (touches.first?.location(in: self))!
        //let touch = touches.first
        lastTouch = touches.first?.location(in: self)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouch = touches.first?.location(in: self)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouch = nil
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let touch = lastTouch {
            //let impulseVector = CGVector(dx: touch.x - player.position.x, dy: touch.y - player.position.y)
            player.physicsBody?.velocity = CGVector(dx: (touch.x - player.position.x) * 2, dy: (touch.y - player.position.y) * 2)
        }
    }
}
