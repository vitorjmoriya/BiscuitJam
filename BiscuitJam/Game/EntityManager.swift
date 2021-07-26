//
//  EntityManager.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 22/07/21.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {

  // 1
    
  var entities = Set<GKEntity>()
    var toRemove = Set<GKEntity>()

  let scene: SKScene
//    lazy var componentSystems: [GKComponentSystem] = {
//      let castleSystem = GKComponentSystem(componentClass: ScoreComponent.self)
//      return [castleSystem]
//    }()

  // 2
  init(scene: SKScene) {
    self.scene = scene
  }

  // 3
  func add(_ entity: GKEntity) {
    entities.insert(entity)

    if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
      scene.addChild(spriteNode)
    }
//    for componentSystem in componentSystems {
//      componentSystem.addComponent(foundIn: entity)
//    }

  }

  // 4
  func remove(_ entity: GKEntity) {
    if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
      spriteNode.removeFromParent()
    }

    entities.remove(entity)
    toRemove.insert(entity)

  }
//    func update(_ deltaTime: CFTimeInterval) {
//      // 1
//      for componentSystem in componentSystems {
//        componentSystem.update(deltaTime: deltaTime)
//      }
//
//      // 2
//      for currentRemove in toRemove {
//        for componentSystem in componentSystems {
//          componentSystem.removeComponent(foundIn: currentRemove)
//        }
//      }
//      toRemove.removeAll()
//    }

//
}
