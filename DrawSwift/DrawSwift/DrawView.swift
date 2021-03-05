//
//  DrawView.swift
//  DrawSwift
//
//  Created by Matt Bradshaw on 3/3/21.
//

import UIKit

class DrawView: UIView {
    @IBOutlet var redPressed: UILabel!
    @IBOutlet var greenPressed: UILabel!
    @IBOutlet var yellowPressed: UILabel!
    @IBOutlet var movingPressed: UILabel!
    @IBOutlet var scoreboard: UILabel!

    var interval = 0
    var timeLimit = 500
    var movingObjX = 0
    var movingObjY = 0
    var randX1 = 0
    var randX2 = 0
    var randX3 = 0
    var randY1 = 0
    var randY2 = 0
    var randY3 = 0
    var dx = 2
    var dy = 2
    var touchedR1 = false
    var touchedR2 = false
    var touchedR3 = false
    var touchedMoving = false
    var score = 0

    override func draw(_ rect: CGRect) {

        if(interval > timeLimit || (touchedR1 && touchedR2 && touchedR3 && touchedMoving)) {
            if(!(interval > timeLimit)) {   // you beat the stage
                score = score + 1
                scoreboard.text = String(score)
                dx = abs(dx) + 2
                dy = abs(dy) + 2
                timeLimit = timeLimit - 35
                print("Score: ", score)
            } else {
                // time ran out without beating the stage
            }
            randomRect()
            interval = 0
            touchedR1 = false
            touchedR2 = false
            touchedR3 = false
            redPressed.text = ""
            greenPressed.text = ""
            yellowPressed.text = ""
            movingPressed.text = ""
            touchedMoving = false
        }
        
        interval = interval + 1
        let color:UIColor = UIColor.yellow
        let movingRect = CGRect(x: movingObjX, y:movingObjY, width:50, height:50)
        
        let randRect1 = CGRect(x: randX1, y:randY1, width:50, height:50)
        
        let randRect2 = CGRect(x: randX2, y:randY2, width:50, height:50)
        
        let randRect3 = CGRect(x: randX3, y:randY3, width:50, height:50)
        
        let bpath:UIBezierPath = UIBezierPath(rect: movingRect)
        let bpathR1:UIBezierPath = UIBezierPath(rect: randRect1)
        let bpathR2:UIBezierPath = UIBezierPath(rect: randRect2)
        let bpathR3:UIBezierPath = UIBezierPath(rect: randRect3)
        
        color.set()
        bpath.stroke()
        bpathR1.stroke()
        bpathR2.stroke()
        bpathR3.stroke()
        
        UIColor.blue.set()
        UIRectFill(movingRect)
        
        UIColor.red.set()
        UIRectFill(randRect1)

        UIColor.green.set()
        UIRectFill(randRect2)

        UIColor.yellow.set()
        UIRectFill(randRect3)
    }
    
    
    @objc func update() {
        movingObjX = movingObjX + dx
        movingObjY = movingObjY + dy
        
//        // gravity
//        dy = dy + 1
//
//        if(dy > 20) {
//            dy = 20
//        }
        
        if movingObjX < Int(self.bounds.minX) {
            movingObjX = movingObjX + 20
            dx = -dx
        }
        if movingObjY < Int(self.bounds.minY) {
            dy = -dy
        }
        if movingObjX > Int(self.bounds.maxX-70) {
            movingObjX = movingObjX - 20
            dx = -dx
        }
        if movingObjY > Int(self.bounds.maxY-70) {
            dy = -dy
        }
        
        setNeedsDisplay()
    }
    
    @objc func randomRect() {
        randX1 = Int.random(in: 1 ..< 300)
        randY1 = Int.random(in: 1 ..< 550)

        randX2 = Int.random(in: 1 ..< 300)
        randY2 = Int.random(in: 1 ..< 550)

        randX3 = Int.random(in: 1 ..< 300)
        randY3 = Int.random(in: 1 ..< 550)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let point = t.location(in: self)
            
            let distanceFromMoving = abs(Int(point.x) - movingObjX) + abs(Int(point.y) - movingObjY)
            let distanceFromR1 = abs(Int(point.x) - randX1) + abs(Int(point.y) - randY1)
            let distanceFromR2 = abs(Int(point.x) - randX2) + abs(Int(point.y) - randY2)
            let distanceFromR3 = abs(Int(point.x) - randX3) + abs(Int(point.y) - randY3)
            
            if(distanceFromMoving < 50) {
//                print("You killed the alien")
                movingPressed.text = "Pressed"
                dx = -dx
                dy = -dy
                touchedMoving = true
            }
            if(distanceFromR1 < 50) {
//                print("Pressed R1")
                redPressed.text = "Pressed"
                touchedR1 = true
//                randX1 = Int.random(in: 1 ..< 300)
//                randY1 = Int.random(in: 1 ..< 550)
            }
            if(distanceFromR2 < 50) {
//                print("Pressed R2")
                greenPressed.text = "Pressed"
                touchedR2 = true
//                randX2 = Int.random(in: 1 ..< 300)
//                randY2 = Int.random(in: 1 ..< 550)
            }
            if(distanceFromR3 < 50) {
//                print("Pressed R3")
                yellowPressed.text = "Pressed"
                touchedR3 = true
//                randX3 = Int.random(in: 1 ..< 300)
//                randY3 = Int.random(in: 1 ..< 550)
            }
            
        }
    }

}
