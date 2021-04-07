//
//  MediumGameScene.swift
//  DDR
//
//  Created by Matt Bradshaw on 4/6/21.
//

import SpriteKit

var medScore: Float!
var medHighScore: Float!
 
class MediumGameScene: SKScene {
    var topRack: SKSpriteNode!
    var leftControl: SKSpriteNode!
    var downControl: SKSpriteNode!
    var upControl: SKSpriteNode!
    var rightControl: SKSpriteNode!
    var leftArrow: SKSpriteNode!
    var rightArrow: SKSpriteNode!
    var upArrow: SKSpriteNode!
    var downArrow: SKSpriteNode!
//    var medScore: Float!
    var leftGen: Bool!
    var leftClick: Bool!
    var downGen: Bool!
    var downClick: Bool!
    var upGen: Bool!
    var upClick: Bool!
    var rightGen: Bool!
    var rightClick: Bool!
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        
        medScore = 0.0
        
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
        
//        run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration:3.0), SKAction.run(makeLeft)])))

        run(SKAction.repeat(SKAction.sequence([
                                                SKAction.wait(forDuration: 0.8), SKAction.run({
                                                    let arrow = Int.random(in:0...3)
                                                    if (arrow == 0) {
                                                        self.makeLeft()
                                                    } else if (arrow == 1) {
                                                        self.makeDown()
                                                    } else if (arrow == 2) {
                                                        self.makeUp()
                                                    } else if (arrow == 3) {
                                                        self.makeRight()
                                                    } else {

                                                    }
                                                })]), count: 100)
                              )
        
    }
    
    
    func makeLeft() {
        leftClick = false
        leftGen = true
        leftArrow = SKSpriteNode(imageNamed: "leftArrow")
        leftArrow.setScale(0.4)
        let xVal = 50.0

        leftArrow.position = CGPoint(x: xVal, y: 0.0)
      
        addChild(leftArrow)
      
        let speed = CGFloat(0.6)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        leftArrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func makeRight() {
        rightClick = false
        rightGen = true
        rightArrow = SKSpriteNode(imageNamed: "rightArrow.jpg")
        rightArrow.setScale(0.6)
        let xVal = 340.0

        rightArrow.position = CGPoint(x: xVal, y: 0.0)
      
        addChild(rightArrow)
      
        let speed = CGFloat(0.6)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        rightArrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func makeUp() {
        upClick = false
        upGen = true
        upArrow = SKSpriteNode(imageNamed: "upArrow.jpg")
        upArrow.setScale(0.1)
        let xVal = 246.0

        upArrow.position = CGPoint(x: xVal, y: 0.0)
      
        addChild(upArrow)
      
        let speed = CGFloat(0.6)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)), duration: TimeInterval(speed))
        let actionMoveDone = SKAction.removeFromParent()
        upArrow.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func makeDown() {
        downClick = false
        downGen = true
        downArrow = SKSpriteNode(imageNamed: "downArrow.jpg")
        downArrow.setScale(0.1)
        let xVal = 150.0

        downArrow.position = CGPoint(x: xVal, y: 0.0)
      
        addChild(downArrow)
      
        let speed = CGFloat(0.6)
      
        let actionMove = SKAction.move(to: CGPoint(x: xVal, y: Double(size.height)), duration: TimeInterval(speed))
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
                    if(leftArrow != nil) {
                        coords = leftArrow.position
                        print(coords)
                    }
                    if(coords.y > 0 && medScore != nil && leftClick == false && leftGen == true) {
                        leftClick = true    // makes it so you can only click once per left arrow
                        let timing = abs(coords.y - 804.0)
                        let arrowmedScore = Float((100 - timing/2.0))
                        if(arrowmedScore > 0) {
                            medScore = medScore + Float((100 - timing/2.0))
                        }
                        leftGen = false
                        print(medScore!)
                    }
                }
                catch { }
            }
            if touchedNode.name == "rightControl" {
                print("right")
                var coords = CGPoint(x:0, y:0)
                do {
                    if(rightArrow != nil) {
                        coords = rightArrow.position
                        print(coords)
                    }
                    if(coords.y > 0 && medScore != nil && rightClick == false && rightGen == true) {
                        rightClick = true    // makes it so you can only click once per left arrow
                        let timing = abs(coords.y - 804.0)
                        let arrowmedScore = Float((100 - timing/2.0))
                        if(arrowmedScore > 0) {
                            medScore = medScore + Float((100 - timing/2.0))
                        }
                        rightGen = false
                        print(medScore!)
                    }
                }
                catch { }
            }
            if touchedNode.name == "upControl" {
                print("up")
                var coords = CGPoint(x:0, y:0)
                do {
                    if(upArrow != nil) {
                        coords = upArrow.position
                        print(coords)
                    }
                    if(coords.y > 0 && medScore != nil && upClick == false && upGen == true) {
                        upClick = true    // makes it so you can only click once per left arrow
                        let timing = abs(coords.y - 804.0)
                        let arrowmedScore = Float((100 - timing/2.0))
                        if(arrowmedScore > 0) {
                            medScore = medScore + Float((100 - timing/2.0))
                        }
                        upGen = false
                        print(medScore!)
                    }
                }
                catch { }
            }
            if touchedNode.name == "downControl" {
                print("down")
                var coords = CGPoint(x:0, y:0)
                do {
                    if(downArrow != nil) {
                        coords = downArrow.position
                        print(coords)
                    }
                    if(coords.y > 0 && medScore != nil && downClick == false && downGen == true) {
                        downClick = true    // makes it so you can only click once per left arrow
                        let timing = abs(coords.y - 804.0)
                        let arrowmedScore = Float((100 - timing/2.0))
                        if(arrowmedScore > 0) {
                            medScore = medScore + Float((100 - timing/2.0))
                        }
                        downGen = false
                        print(medScore!)
                    }
                }
                catch { }
            }
        }
    }
}
