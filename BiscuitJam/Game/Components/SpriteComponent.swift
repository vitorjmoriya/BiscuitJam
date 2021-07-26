//
//  SpriteComponent.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 22/07/21.
//

import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {

  let node: SKSpriteNode

  init(texture: SKTexture) {
    node = SKSpriteNode(texture: texture, color: .white, size: texture.size())
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
