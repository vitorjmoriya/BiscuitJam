//
//  ScoreComponent.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 22/07/21.
//

//import Foundation
//import SpriteKit
//import GameplayKit
//
//class ScoreComponent: GKComponent {
//
//  // 1
//  var coins = 0
//  var lastCoinDrop = TimeInterval(0)
//
//  override init() {
//    super.init()
//  }
//  
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  // 2
//  override func update(deltaTime seconds: TimeInterval) {
//    super.update(deltaTime: seconds)
//  
//  // 3
//    let coinDropInterval = TimeInterval(0.5)
//    let coinsPerInterval = 10
//    if (CACurrentMediaTime() - lastCoinDrop > coinDropInterval) {
//      lastCoinDrop = CACurrentMediaTime()
//      coins += coinsPerInterval
//    }
//  }
//}
