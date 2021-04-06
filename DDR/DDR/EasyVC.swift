//
//  EasyVC.swift
//  DDR
//
//  Created by Matt Bradshaw on 3/31/21.
//

import AVFoundation
import SpriteKit
import UIKit

class EasyVC: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = Bundle.main.path(forResource: "absolute", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
            
            player.play()
        }
        catch {
            print("ERROR: Audio Player Issue")
        }
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.presentScene(scene)
        
    }
    
}
