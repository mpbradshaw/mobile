import AVFoundation
import UIKit

class HardVC: UIViewController {
    
    @IBOutlet var right: UIButton!
    @IBOutlet var left: UIButton!
    @IBOutlet var up: UIButton!
    @IBOutlet var down: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = Bundle.main.path(forResource: "legend", ofType: "mp3")
        
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
    }

}
