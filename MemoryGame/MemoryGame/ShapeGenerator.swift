//
//  ShapeGenerator.swift
//  MemoryGame
//
//  Created by Ali Can Arslan on 17.11.22.
//

import Foundation
import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.size.height, rect.size.width) / 2
        
        var point = CGPoint(
          x: center.x + radius * cos(CGFloat.pi / 3 * CGFloat(0)),
          y: center.y + radius * sin(CGFloat.pi / 3 * CGFloat(0)))
        
        path.move(to: point)
        
        point = CGPoint(
          x: center.x + radius * cos(CGFloat.pi / 3 * CGFloat(1)),
          y: center.y + radius * sin(CGFloat.pi / 3 * CGFloat(1)))
        
        path.addLine(to: point)
        
        point = CGPoint(
          x: center.x + radius * cos(CGFloat.pi / 3 * CGFloat(2)),
          y: center.y + radius * sin(CGFloat.pi / 3 * CGFloat(2)))
        path.addLine(to: point)
        
        point = CGPoint(
          x: center.x + radius * cos(CGFloat.pi / 3 * CGFloat(3)),
          y: center.y + radius * sin(CGFloat.pi / 3 * CGFloat(3)))
        path.addLine(to: point)
        
        point = CGPoint(
          x: center.x + radius * cos(CGFloat.pi / 3 * CGFloat(4)),
          y: center.y + radius * sin(CGFloat.pi / 3 * CGFloat(4)))
        path.addLine(to: point)
        
        point = CGPoint(
          x: center.x + radius * cos(CGFloat.pi / 3 * CGFloat(5)),
          y: center.y + radius * sin(CGFloat.pi / 3 * CGFloat(5)))
        path.addLine(to: point)
        
        path.closeSubpath()
        return path
    }

}
