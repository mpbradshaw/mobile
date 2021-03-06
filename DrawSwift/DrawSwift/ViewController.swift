//
//  ViewController.swift
//  DrawSwift
//
//  Created by Matt Bradshaw on 3/3/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var drawer: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
    }
    
    @objc func update() {
//        print("Update")
        drawer.update()
    }


}

