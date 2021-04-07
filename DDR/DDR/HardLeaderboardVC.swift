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
        
        currentScore.text = "Score: " + hardScore.description
    }

}
