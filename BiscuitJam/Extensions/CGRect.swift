//
//  CGRect.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 25/07/21.
//

import SpriteKit
extension CGRect {
    func randomPoint() -> CGPoint {
        return CGPoint(x:CGFloat(Int.random(in: -310 ..< 310)),
                       y:CGFloat(Int.random(in: -158 ..< 80)))
    }
    func randomBorderPoint() -> CGPoint {
        var toX = CGFloat(0)
        var toY = CGFloat(0)
        switch Int.random(in: 0 ..< 3) {
        case 0:
            toX = CGFloat(Int.random(in: -310 ..< 310))
            toY = CGFloat(80)
        case 1:
            toX = CGFloat(310)
            toY = CGFloat(Int.random(in: -158 ..< 80))
        case 2:
            toX = CGFloat(Int.random(in: -310 ..< 310))
            toY = CGFloat(-158)
        case 3:
            toX = CGFloat(-310)
            toY = CGFloat(Int.random(in: -158 ..< 80))
        default:
            print("merda")
        }
        return CGPoint(x: toX, y: toY)
    }
    
}
