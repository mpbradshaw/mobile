//
//  DrawView.swift
//  DrawSwift
//
//  Created by Matt Bradshaw on 3/3/21.
//

import UIKit

class DrawView: UIView {

    var interval = 0
    var objx = 0
    var objy = 0
    var dx = 5
    var dy = 5
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        interval = interval + 1
        let color:UIColor = UIColor.yellow
        let drect = CGRect(x: objx, y:objy, width:50, height:50)
        if(interval % 200 == 0) {
            randomRect()
        }
        else {

        }
        
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        
        UIColor.blue.set()
        
        UIRectFill(drect)
        
//        NSLog("DrawRect called")
    }
    
    
    @objc func update() {
//        print("DrawView Update")
        objx = objx + dx
        objy = objy + dy
        
//        // gravity
//        dy = dy + 1
//
//        if(dy > 20) {
//            dy = 20
//        }
        
        if objx < Int(self.bounds.minX) {
            dx = -dx
        }
        if objy < Int(self.bounds.minY) {
            dy = -dy
        }
        if objx > Int(self.bounds.maxX-50) {
            dx = -dx
        }
        if objy > Int(self.bounds.maxY-50) {
            dy = -dy
        }
        
        setNeedsDisplay()
    }
    
    @objc func randomRect() {
        print("calling randomRect")
        let randRect = CGRect(x: Int.random(in: 1 ..< 300), y: Int.random(in: 1 ..< 550), width: 50, height: 50)
        UIRectFill(randRect)
        setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let point = t.location(in: self)
            
//            objx = Int(point.x)
//            objy = Int(point.y)
            let distance = abs(Int(point.x) - objx) + abs(Int(point.y) - objy)
            print(distance)
            print(objx)
            print(objy)
            print(point.x)
            print(point.y)
            if(distance < 30) {
                print("You killed the alien")
                dx = -dx
                dy = -dy
            }
        }
    }

}
