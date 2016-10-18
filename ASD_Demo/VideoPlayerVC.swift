import UIKit
import AVKit
import AVFoundation

class VideoPlayerVC: UIViewController {
    
    private var firstAppear = true
    public var choice = ""
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if firstAppear {
            do {
                var videoName = ""
                switch (DTO.dto.getBodyPartChoice()) {
                    case "Tummy":
                        videoName = "Tummy"
                        break;
                    case "Ears":
                        videoName = "Ears"
                        break;
                    case "Head":
                        videoName = "Neck"
                        break;
                    case "Neck":
                        videoName = "Neck"
                        break;
                    case "Arms":
                        videoName = "Armz"
                        break;
                    case "Legs":
                        videoName = "Legs"
                        break;
                    
                    default:
                        videoName = "Armz"
                }
                
                try playVideo(videoTitle: videoName)
                firstAppear = false
            } catch AppError.InvalidResource(let name, let type) {
                debugPrint("Could not find resource \(name).\(type)")
            } catch {
                debugPrint("Generic error")
            }
        }
        
        print(DTO.dto.getBodyPartChoice())
    }
    
    private func playVideo(videoTitle: String) throws {
        guard let path = Bundle.main.path(forResource: videoTitle, ofType:"mp4") else {
            throw AppError.InvalidResource(videoTitle, "mp4")
        }
        let player = AVPlayer(url: NSURL(fileURLWithPath: path) as URL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        playerController.view.frame = CGRect(origin: CGPoint(x: 0, y: self.view.bounds.height * 0.25), size: CGSize(width: self.view.frame.width, height: 300))
        self.view.addSubview(playerController.view)
        self.addChildViewController(playerController)
        player.play()
    }
}

enum AppError : Error {
    case InvalidResource(String, String)
}