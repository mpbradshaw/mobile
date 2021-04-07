//
//  HardLeaderboardVC.swift
//  DDR
//
//  Created by Matt Bradshaw on 4/7/21.
//

import UIKit

class EasyLeaderboardVC: UIViewController {
    @IBOutlet var currentScore: UILabel!
    @IBOutlet var highScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var highScoreDefault = UserDefaults.standard
        
        // if there is already a high score, use it at first
        if(highScoreDefault.value(forKey: "easyHighScore") != nil) {
            easyHighScore = highScoreDefault.value(forKey: "easyHighScore") as? Float
        }
        else {  // if there isn't, use the current score
            easyHighScore = easyScore
            var highScoreDefault = UserDefaults.standard
            highScoreDefault.setValue(easyHighScore, forKey: "easyHighScore")
            highScoreDefault.synchronize()        }
        
        // check if we should be using the default (previous) high score, or this new score
        if(easyScore > easyHighScore) {
            easyHighScore = easyScore
            var highScoreDefault = UserDefaults.standard
            highScoreDefault.setValue(easyHighScore, forKey: "easyHighScore")
            highScoreDefault.synchronize()
        }
        
        currentScore.text = "Score: " + easyScore.description
        highScore.text = "High Score: " + easyHighScore.description
    }

}
