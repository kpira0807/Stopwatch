import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewLabel: UIView!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    var timer = Timer()
    var (hours, minutes, seconds, fractions) = (0, 0, 0, 0)
    
    @IBAction func startButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.keepTimer), userInfo: nil, repeats: true)
        startButton.isHidden = true
        pauseButton.isHidden = false
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
        startButton.isHidden = false
        pauseButton.isHidden = false
    }
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
        (hours, minutes, seconds, fractions) = (0, 0, 0, 0)
        timeLabel.text = "00 : 00 : 00 . 00"
        startButton.isHidden = false
        pauseButton.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "00 : 00 : 00 . 00"
        pauseButton.isHidden = true
        
        
        startButton.backgroundColor = UIColor.greenButton
        startButton.layer.cornerRadius = startButton.frame.size.width / 2
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.clipsToBounds = true
        
        pauseButton.backgroundColor = UIColor.yellowButton
        pauseButton.layer.cornerRadius = pauseButton.frame.size.width / 2
        pauseButton.layer.borderWidth = 1
        pauseButton.layer.borderColor = UIColor.black.cgColor
        pauseButton.clipsToBounds = true
        
        stopButton.backgroundColor = UIColor.redButton
        stopButton.layer.cornerRadius = pauseButton.frame.size.width / 2
        stopButton.layer.borderWidth = 1
        stopButton.layer.borderColor = UIColor.black.cgColor
        stopButton.clipsToBounds = true
        
        viewLabel.backgroundColor = UIColor.greyColor
        viewLabel.layer.cornerRadius = 7
        viewLabel.layer.borderWidth = 1
        viewLabel.clipsToBounds = true
        
    }

    @objc func keepTimer() {
        
        fractions += 1
        if fractions > 99 {
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        if minutes == 60 {
            hours += 1
            minutes = 0
        }
        
        let secondString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minuteString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        let hoursString = hours > 9 ? "\(hours)" : "0\(hours)"
        
        timeLabel.text = "\(hoursString) : \(minuteString) : \(secondString) . \(fractions)"
        
    }
    
}

