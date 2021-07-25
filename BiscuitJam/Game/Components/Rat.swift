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

    // 2
    let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
    addComponent(spriteComponent)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//class WhiteRat : SKSpriteNode, Rat {     deve-se herar com esse codigo
//
//}
