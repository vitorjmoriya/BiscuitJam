//
//  CGRect.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 25/07/21.
//

import SpriteKit
extension CGRect {
    func randomPoint() -> CGPoint {
        let origin = self.origin
        return CGPoint(x:CGFloat(arc4random_uniform(UInt32(self.width))) + origin.x,
                       y:CGFloat(arc4random_uniform(UInt32(self.height))) + origin.y)
    }
    func randomBorderPoint(fromPosition: CGPoint) -> CGPoint {
        var toX = CGFloat(0)
        var toY = CGFloat(0)
        switch Int.random(in: 0 ..< 3) {
        case 0:
            toX = CGFloat(Int.random(in: -290 ..< 290))
            toY = CGFloat(145)
        case 1:
            toX = CGFloat(290)
            toY = CGFloat(Int.random(in: -145 ..< 145))
        case 2:
            toX = CGFloat(Int.random(in: -290 ..< 290))
            toY = CGFloat(-145)
        case 3:
            toX = CGFloat(-290)
            toY = CGFloat(Int.random(in: -145 ..< 145))
        default:
            print("merda")
        }
        return CGPoint(x: toX, y: toY)
    }
    
}
