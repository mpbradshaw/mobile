//
//  MediumVC.swift
//  DDR
//
//  Created by Matt Bradshaw on 3/31/21.
//

import AVFoundation
import SpriteKit
import UIKit

class MediumVC: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = Bundle.main.path(forResource: "stars", ofType: "mp3")
        
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
        
        let scene = MediumGameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.presentScene(scene)
        
        let delayTime = DispatchTime.now() + 82.0
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MediumLeaderboardVC") as! MediumLeaderboardVC
                self.present(vc, animated: true, completion: nil)
        })
    }

}
