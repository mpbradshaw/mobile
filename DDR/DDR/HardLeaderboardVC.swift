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
        if(highScoreDefault.value(forKey: "hardHighScore") != nil) {
            hardHighScore = highScoreDefault.value(forKey: "hardHighScore") as? Float
        }
        else {
            hardHighScore = hardScore
            var highScoreDefault = UserDefaults.standard
            highScoreDefault.setValue(hardHighScore, forKey: "hardHighScore")
            highScoreDefault.synchronize()        }
        
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
