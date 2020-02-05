//
//  ViewController.swift
//  DominoScore
//
//  Created by Gevorg Avagyan on 7/12/19.
//  Copyright © 2019 Gevorg Avagyan. All rights reserved.
//

import UIKit

var scoreSaveArray = [String]()

class ViewController: UIViewController {
    
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet var buttonsOutlet: [UIButton]!
    
    var team1Score = 0
    var team2Score = 0
    var team1Name = ""
    var team2Name = ""

//    @objc func timerUpdater(t:Timer) {
//        UIApplication.shared.isIdleTimerDisabled = false
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        team1.layer.cornerRadius = 15
        team2.layer.cornerRadius = 15
        
        let clearButton = UIBarButtonItem.init(title: "Clear", style: .plain, target: self, action: #selector(clearButtonFunc))
        let saveButton = UIBarButtonItem.init(title: "Save", style: .plain, target: self, action: #selector(saveButtonFunc))
        let colorButton = UIBarButtonItem.init(title: "Colors", style: .plain, target: self, action: #selector(colorButtonFunc))
        self.navigationItem.rightBarButtonItems = [clearButton, saveButton, colorButton]
        
        team1.text = team1Name 
        team2.text = team2Name
        
//        let timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.timerUpdater(t:)), userInfo: nil, repeats: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        team1.textColor = globalTextColor
        team2.textColor = globalTextColor
        
        team1.backgroundColor = globalButtonColor
        team2.backgroundColor = globalButtonColor
        
        self.view.backgroundColor = globalBackgroundColor
        
        for i in buttonsOutlet {
            i.backgroundColor = globalButtonColor    
            i.setTitleColor(globalTextColor, for: .normal)
        }
//        UIApplication.shared.isIdleTimerDisabled = true
        
    }
    
    
    @IBAction func team1ScoreAdd(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.5, animations: {
            sender.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
            sender.alpha = 0
        }) { (_) in
            sender.transform = CGAffineTransform.identity.scaledBy(x: 0, y: 0)
            UIButton.animate(withDuration: 0.3, animations: {
                sender.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
                sender.alpha = 1
            })
        }
        if sender.tag == 0 { 
            team1Score = team1Score - 5
        }
        if sender.tag > 1 {
            team1Score = team1Score + sender.tag
        }
        if team1Score >= 355 {
            team1.backgroundColor = .red
        }
        if team1Score < 355 {
            team1.backgroundColor = globalButtonColor
        }
        team1.text = team1Name + "  ->  " + String(team1Score)
    }
    
    @IBAction func team2ScoreAdd(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.6, animations: {
            sender.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
            sender.alpha = 0
        }) { (_) in
            sender.transform = CGAffineTransform.identity.scaledBy(x: 0, y: 0)
            UIButton.animate(withDuration: 0.4, animations: {
                sender.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
                sender.alpha = 1
            })
        }
        if sender.tag == 0 {
            team2Score = team2Score - 5
        }
        if sender.tag > 1 {
            team2Score = team2Score + sender.tag
        }
        
        if team2Score >= 355 {
            team2.backgroundColor = .red
        }
        if team2Score < 355 {
            team2.backgroundColor = globalButtonColor
        }
        team2.text = team2Name + "  ->  " + String(team2Score)
    }
    
    @objc func clearButtonFunc() {
        team1.backgroundColor = globalButtonColor
        team2.backgroundColor = globalButtonColor
        team1Score = 0
        team2Score = 0
        team1.text = team1Name
        team2.text = team2Name
    }
    
    @objc func saveButtonFunc() {
        scoreSaveArray.append("\(team1.text!)  \(team2.text!)")
        let alert = UIAlertController(title: "Saved", message: "Your score successfully has been saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        UserDefaults.standard.set(scoreSaveArray, forKey: "saved")
        
    }
    @objc func colorButtonFunc() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "colorsVC") as! ColorsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
