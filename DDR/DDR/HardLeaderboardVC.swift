//
//  HardLeaderboardVC.swift
//  DDR
//
//  Created by Matt Bradshaw on 4/7/21.
//

import UIKit

class HardLeaderboardVC: UIViewController {
    @IBOutlet var currentScore: UILabel!
    @IBOutlet var highScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var highScoreDefault = UserDefaults.standard
        
        // if there is already a high score, use it at first
        if(highScoreDefault.value(forKey: "hardHighScore") != nil) {
            hardHighScore = highScoreDefault.value(forKey: "hardHighScore") as? Float
        }
        else {  // if there isn't, use the current score
            hardHighScore = hardScore
            var highScoreDefault = UserDefaults.standard
            highScoreDefault.setValue(hardHighScore, forKey: "hardHighScore")
            highScoreDefault.synchronize()        }
        
        // check if we should be using the default (previous) high score, or this new score
        if(hardScore > hardHighScore) {
            hardHighScore = hardScore
            var highScoreDefault = UserDefaults.standard
            highScoreDefault.setValue(hardHighScore, forKey: "hardHighScore")
            highScoreDefault.synchronize()
        }
        
        currentScore.text = "Score: " + hardScore.description
        highScore.text = "High Score: " + hardHighScore.description
    }

}
