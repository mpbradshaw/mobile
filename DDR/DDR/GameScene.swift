//
//  GameScene.swift
//  DDR
//
//  Created by Matt Bradshaw on 4/2/21.
//

import SpriteKit
 
class GameScene: SKScene {
      
    override func didMove(to view: SKView) {
//      backgroundColor = SKColor.white
      makeLeft()
        run(SKAction.repeatForever(
              SKAction.sequence([
                SKAction.run(makeLeft),
                SKAction.wait(forDuration: 4.0)
                ])
            ))
    }
    
    func random() -> CGFloat {
      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
      return random() * (max - min) + min
    }
    
    func makeLeft() {
      // Create sprite
        let arrow = SKSpriteNode(imageNamed: "leftArrow")
        let xVal = 20.0

        arrow.position = CGPoint(x: xVal, y: -Double(size.height)+20.0)
      
      // Add the arrow to the scene
        addChild(arrow)
      
      // Determine speed of the arrow
        let speed = CGFloat(4.0)
      
      // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        arrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
}
