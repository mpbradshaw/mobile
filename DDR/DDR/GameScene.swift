//
//  GameScene.swift
//  DDR
//
//  Created by Matt Bradshaw on 4/2/21.
//

import SpriteKit
 
class GameScene: SKScene {
    var topRack: SKSpriteNode!
    var leftControl: SKSpriteNode!
    var downControl: SKSpriteNode!
    var upControl: SKSpriteNode!
    var rightControl: SKSpriteNode!
    var leftArrow: SKSpriteNode!
    var rightArrow: SKSpriteNode!
    var upArrow: SKSpriteNode!
    var downArrow: SKSpriteNode!
    var score: Float!
    var leftGens: Int!
    var leftClicks: Int!
    var downGens: Int!
    var downClicks: Int!
    var upGens: Int!
    var upClicks: Int!
    var rightGens: Int!
    var rightClicks: Int!
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        
        score = 0.0
        
        topRack = SKSpriteNode(imageNamed: "arrows")
        topRack.setScale(0.73)
        topRack.position = CGPoint(x: 195.0, y: 800.0)
        addChild(topRack)
        
        leftControl = SKSpriteNode(imageNamed: "upControl.jpg")
        leftControl.name = "leftControl"
        leftControl.zRotation = .pi / 2
        leftControl.setScale(0.07)
        leftControl.position = CGPoint(x: 80.0, y: 200.0)
        downControl = SKSpriteNode(imageNamed: "upControl.jpg")
        downControl.name = "downControl"
        downControl.zRotation = .pi
        downControl.setScale(0.07)
        downControl.position = CGPoint(x: 195.0, y: 85.0)
        upControl = SKSpriteNode(imageNamed: "upControl.jpg")
        upControl.name = "upControl"
        upControl.setScale(0.07)
        upControl.position = CGPoint(x: 195.0, y: 315.0)
        rightControl = SKSpriteNode(imageNamed: "upControl.jpg")
        rightControl.name = "rightControl"
        rightControl.zRotation = -(.pi / 2)
        rightControl.setScale(0.07)
        rightControl.position = CGPoint(x: Double(size.width)-80.0, y: 200.0)
        
        addChild(leftControl)
        addChild(downControl)
        addChild(upControl)
        addChild(rightControl)
        
//        makeLeft()
//        makeDown()
//        makeUp()
//        makeRight()

        run(SKAction.repeatForever(
              SKAction.sequence([
                SKAction.run(makeLeft),
//                SKAction.run(makeDown),
//                SKAction.run(makeUp),
//                SKAction.run(makeRight),
                SKAction.wait(forDuration: 5.0)
                ])
            ))
    }
    
    func makeLeft() {
        leftArrow = SKSpriteNode(imageNamed: "leftArrow")
        leftArrow.setScale(0.4)
        let xVal = 50.0

        leftArrow.position = CGPoint(x: xVal, y: -Double(size.height)+20.0)
      
        addChild(leftArrow)
      
        let speed = CGFloat(4.0)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)-40.0), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        leftArrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func makeRight() {
        rightArrow = SKSpriteNode(imageNamed: "rightArrow.jpg")
        rightArrow.setScale(0.6)
        let xVal = 340.0

        rightArrow.position = CGPoint(x: xVal, y: -Double(size.height)+20.0)
      
        addChild(rightArrow)
      
        let speed = CGFloat(4.0)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)-40.0), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        rightArrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func makeUp() {
        upArrow = SKSpriteNode(imageNamed: "upArrow.jpg")
        upArrow.setScale(0.1)
        let xVal = 246.0

        upArrow.position = CGPoint(x: xVal, y: -Double(size.height)+20.0)
      
        addChild(upArrow)
      
        let speed = CGFloat(4.0)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)-40.0), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        upArrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func makeDown() {
        downArrow = SKSpriteNode(imageNamed: "downArrow.jpg")
        downArrow.setScale(0.1)
        let xVal = 150.0

        downArrow.position = CGPoint(x: xVal, y: -Double(size.height)+20.0)
      
        addChild(downArrow)
      
        let speed = CGFloat(4.0)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)-40.0), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        downArrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)

            if touchedNode.name == "leftControl" {
                print("left")
                var coords = CGPoint(x:0, y:0)
                do {
                    coords = leftArrow.position
                    if(coords.y > 0 && score != nil && leftClicks < leftGens) {
                        let timing = abs(coords.y - 804.0)
                        score = score + Float((100 - timing))
                    }
                }
                catch { }
                
                print(score!)
            }
            if touchedNode.name == "rightControl" {
                print("right")
            }
            if touchedNode.name == "upControl" {
                print("up")
            }
            if touchedNode.name == "downControl" {
                print("down")
            }
        }
    }
}
