//
//  ViewController.swift
//  pomodoro
//
//  Created by Émerson M Luz on 31/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btStart: UIButton!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var sgControl: UISegmentedControl!
    
    var pomodoroMinute: Int = 24
    var pomodoroSeconds: Int = 59
    var pomodoroTime: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func start(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "Start" {
            sender.setTitle("Stop", for: .normal)
        } else {
            sender.setTitle("Start", for: .normal)
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {timer in
            self.time()
            if sender.titleLabel?.text == "Start" || self.pomodoroMinute == 0 && self.pomodoroSeconds == -1 {
                timer.invalidate()
                self.reset()
            }
        }
    }
    
    @IBAction func clickSgControl(_ sender: Any) {
        reset()
        switch sgControl.selectedSegmentIndex {
            case 0:
                pomodoroMinute = 24
            case 1:
                pomodoroMinute = 4
            case 2:
                pomodoroMinute = 14
        default:
            print("Algo de errado não está certo.")
        }
    }
    
    func time () {
        pomodoroTime = ""
        pomodoroTime.append(String(pomodoroMinute))
        pomodoroTime.append(":")
        
        if pomodoroSeconds >= 10 {
            pomodoroTime.append(String(pomodoroSeconds))
        } else {
            pomodoroTime.append("0")
            pomodoroTime.append(String(pomodoroSeconds))
        }
        
        lbTime.text = self.pomodoroTime
        pomodoroSeconds -= 1
        
        if pomodoroSeconds == 0 && pomodoroMinute != 0 {
            pomodoroMinute -= 1
            pomodoroSeconds = 59
        }
    }
    
    func reset () {
        lbTime.text = "00:00"
        pomodoroMinute = 24
        pomodoroSeconds = 59
        btStart.titleLabel?.text = "Start"
    }
    
}

