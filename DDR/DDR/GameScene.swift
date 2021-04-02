//
//  GameScene.swift
//  DDR
//
//  Created by Matt Bradshaw on 4/2/21.
//

import SpriteKit
 
class GameScene: SKScene {
    var leftControl: SKSpriteNode!
    var downControl: SKSpriteNode!
    var upControl: SKSpriteNode!
    var rightControl: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        
        leftControl = SKSpriteNode(imageNamed: "upControl.jpg")
        leftControl.zRotation = .pi / 2
        leftControl.setScale(0.07)
        leftControl.position = CGPoint(x: 80.0, y: 200.0)
        downControl = SKSpriteNode(imageNamed: "upControl.jpg")
        downControl.zRotation = .pi
        downControl.setScale(0.07)
        downControl.position = CGPoint(x: 195.0, y: 85.0)
        upControl = SKSpriteNode(imageNamed: "upControl.jpg")
        upControl.setScale(0.07)
        upControl.position = CGPoint(x: 195.0, y: 315.0)
        rightControl = SKSpriteNode(imageNamed: "upControl.jpg")
        rightControl.zRotation = -(.pi / 2)
        rightControl.setScale(0.07)
        rightControl.position = CGPoint(x: Double(size.width)-80.0, y: 200.0)
        
        addChild(leftControl)
        addChild(downControl)
        addChild(upControl)
        addChild(rightControl)

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
