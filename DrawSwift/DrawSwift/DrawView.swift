//
//  DrawView.swift
//  DrawSwift
//
//  Created by Matt Bradshaw on 3/3/21.
//

import UIKit

class DrawView: UIView {

    var objx = 0
    var objy = 0
    var dx = 1
    var dy = 1
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let color:UIColor = UIColor.yellow
        let drect = CGRect(x: objx, y:objy, width:50, height:50)
        
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        
        UIColor.blue.set()
        
        UIRectFill(drect)
        
        NSLog("DrawRect called")
    }
    
    
    @objc func update() {
        print("DrawView Update")
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
        if objx > Int(self.bounds.maxX) {
            dx = -dx
        }
        if objy > Int(self.bounds.maxY) {
            dy = -dy
        }
        
        setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let point = t.location(in: self)
            
//            objx = Int(point.x)
//            objy = Int(point.y)
//            var distance = abs(Int(point.x) - objx) + abs(Int(point.y) - objy)
//            if(distance < 30) {
//                print("You killed the alien")
//                dx = -dx
//                dy = -dy
//            }
        }
    }

}
