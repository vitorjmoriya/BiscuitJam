//
//  CGPoint.swift
//  BiscuitJam
//
//  Created by Vitor Jundi Moriya on 25/07/21.
//

import SpriteKit

extension CGPoint {
    func distance(point: CGPoint) -> CGFloat {
        return abs(CGFloat(hypotf(Float(point.x - x), Float(point.y - y))))
    }
}
