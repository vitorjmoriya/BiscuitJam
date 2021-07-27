//
//  BlindRat.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 25/07/21.
//

import Foundation
import SpriteKit
import GameplayKit
class BlindRat: Rat {
    
    override init(imageName: String) {
        super.init(imageName: imageName)
        // 2
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        addComponent(spriteComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func ratMove(within rect:CGRect){
        
        //Go randomly around the screen within view bounds
        let point = rect.randomPoint()
        
        //Formula: time = distance / speed
        let duration = TimeInterval(point.distance(point: (self.component(ofType: SpriteComponent.self)?.node.position)!) / 100)
        let move = SKAction.move(to: point, duration: duration)
        let angle = atan2(point.y - (self.component(ofType: SpriteComponent.self)?.node.position.y)!, point.x - (self.component(ofType: SpriteComponent.self)?.node.position.x)!)
        self.component(ofType: SpriteComponent.self)?.node.zRotation = angle - CGFloat(Double.pi/2)
        let block = SKAction.run {
            self.ratMove(within: rect)
        }
        let loop = SKAction.sequence([move,block])
        
        self.component(ofType: SpriteComponent.self)?.node.run(loop)
    }
}

