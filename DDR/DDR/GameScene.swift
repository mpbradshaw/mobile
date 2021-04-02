//
//  GameScene.swift
//  DDR
//
//  Created by Matt Bradshaw on 4/2/21.
//

import SpriteKit
 
class GameScene: SKScene {
      
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
//        makeLeft()
//        makeDown()
//        makeUp()
//        makeRight()
        run(SKAction.repeatForever(
              SKAction.sequence([
//                SKAction.run(makeLeft),
//                SKAction.run(makeDown),
                SKAction.run(makeUp),
                SKAction.run(makeRight),
                SKAction.wait(forDuration: 2.0)
                ])
            ))
    }
    
    func makeLeft() {
        let arrow = SKSpriteNode(imageNamed: "leftArrow")
        arrow.setScale(0.4)
        let xVal = 50.0

        arrow.position = CGPoint(x: xVal, y: -Double(size.height)+20.0)
      
        addChild(arrow)
      
        let speed = CGFloat(4.0)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)-40.0), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        arrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func makeRight() {
        let arrow = SKSpriteNode(imageNamed: "rightArrow.jpg")
        arrow.setScale(0.6)
        let xVal = 340.0

        arrow.position = CGPoint(x: xVal, y: -Double(size.height)+20.0)
      
        addChild(arrow)
      
        let speed = CGFloat(4.0)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)-40.0), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        arrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func makeUp() {
        let arrow = SKSpriteNode(imageNamed: "upArrow.jpg")
        arrow.setScale(0.1)
        let xVal = 246.0

        arrow.position = CGPoint(x: xVal, y: -Double(size.height)+20.0)
      
        addChild(arrow)
      
        let speed = CGFloat(4.0)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)-40.0), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        arrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func makeDown() {
        let arrow = SKSpriteNode(imageNamed: "downArrow.jpg")
        arrow.setScale(0.1)
        let xVal = 150.0

        arrow.position = CGPoint(x: xVal, y: -Double(size.height)+20.0)
      
        addChild(arrow)
      
        let speed = CGFloat(4.0)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)-40.0), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        arrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "LeftButton" {
                // Call the function here.
            }
            if touchedNode.name == "RightButton" {
                // Call the function here.
            }
            if touchedNode.name == "UpButton" {
                // Call the function here.
            }
            if touchedNode.name == "DownButton" {
                // Call the function here.
            }
        }
    }
}
