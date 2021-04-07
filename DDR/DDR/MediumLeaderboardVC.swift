//
//  HardLeaderboardVC.swift
//  DDR
//
//  Created by Matt Bradshaw on 4/7/21.
//

import UIKit

class MediumLeaderboardVC: UIViewController {
    @IBOutlet var currentScore: UILabel!
    @IBOutlet var highScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var highScoreDefault = UserDefaults.standard
        
        // if there is already a high score, use it at first
        if(highScoreDefault.value(forKey: "medHighScore") != nil) {
            medHighScore = highScoreDefault.value(forKey: "medHighScore") as? Float
        }
        else {  // if there isn't, use the current score
            medHighScore = medScore
            var highScoreDefault = UserDefaults.standard
            highScoreDefault.setValue(medHighScore, forKey: "medHighScore")
            highScoreDefault.synchronize()        }
        
        // check if we should be using the default (previous) high score, or this new score
        if(medScore > medHighScore) {
            medHighScore = medScore
            var highScoreDefault = UserDefaults.standard
            highScoreDefault.setValue(medHighScore, forKey: "medHighScore")
            highScoreDefault.synchronize()
        }
        
        currentScore.text = "Score: " + medScore.description
        highScore.text = "High Score: " + medHighScore.description
    }

}
