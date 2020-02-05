//
//  ThreePlayerViewController.swift
//  DominoScore
//
//  Created by Gevorg Avagyan on 12/16/19.
//  Copyright © 2019 Gevorg Avagyan. All rights reserved.
//

import UIKit

class ThreePlayerViewController: UIViewController {
    
    var player1Name = ""
    var player2Name = ""
    var player3Name = ""
    var player1Score = 0
    var player2Score = 0
    var player3Score = 0
    
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player3Label: UILabel!
    
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var player3ScoreLabel: UILabel!
    
    @IBOutlet var buttonsOutlet: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1Label.text = player1Name
        player2Label.text = player2Name
        player3Label.text = player3Name
        
        let clearButton = UIBarButtonItem.init(title: "Clear", style: .plain, target: self, action: #selector(clearButtonFunc))
        let saveButton = UIBarButtonItem.init(title: "Save", style: .plain, target: self, action: #selector(saveButtonFunc))
        
        let colorButton = UIBarButtonItem.init(title: "Colors", style: .plain, target: self, action: #selector(colorButtonFunc))
        
        self.navigationItem.rightBarButtonItems = [clearButton, saveButton, colorButton]

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        for i in buttonsOutlet {
            i.backgroundColor = globalButtonColor
            i.setTitleColor(globalTextColor, for: .normal)
        }
        
        player1Label.backgroundColor = globalButtonColor
        player1Label.textColor = globalTextColor
        player1ScoreLabel.backgroundColor = globalButtonColor
        player1ScoreLabel.textColor = globalTextColor
        
        player2Label.backgroundColor = globalButtonColor
        player2Label.textColor = globalTextColor
        player2ScoreLabel.backgroundColor = globalButtonColor
        player2ScoreLabel.textColor = globalTextColor
        
        player3Label.backgroundColor = globalButtonColor
        player3Label.textColor = globalTextColor
        player3ScoreLabel.backgroundColor = globalButtonColor
        player3ScoreLabel.textColor = globalTextColor
        
        self.view.backgroundColor = globalBackgroundColor
    }
    @IBAction func player1ScoreButton(_ sender: UIButton) {
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
            player1Score = player1Score - 5
        }
        if sender.tag > 1 {
            player1Score = player1Score + sender.tag
        }
        
        if player1Score >= 355 {
            player1ScoreLabel.backgroundColor = .red
        }
        if player1Score < 355 {
            player1ScoreLabel.backgroundColor = globalButtonColor
        }
        player1ScoreLabel.text = String(player1Score)
    }
    
    @IBAction func player2ScoreButton(_ sender: UIButton) {
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
            player2Score = player2Score - 5
        }
        if sender.tag > 1 {
            player2Score = player2Score + sender.tag
        }
        
        if player2Score >= 355 {
            player2ScoreLabel.backgroundColor = .red
        }
        if player2Score < 355 {
            player2ScoreLabel.backgroundColor = globalButtonColor
        }
        player2ScoreLabel.text = String(player2Score)
    }
    
    @IBAction func player3ScoreButton(_ sender: UIButton) {
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
            player3Score = player3Score - 5
        }
        if sender.tag > 1 {
            player3Score = player3Score + sender.tag
        }
        
        if player3Score >= 355 {
            player3ScoreLabel.backgroundColor = .red
        }
        if player3Score < 355 {
            player3ScoreLabel.backgroundColor = globalButtonColor
        }
        player3ScoreLabel.text = String(player3Score)
    }
    
    
    @objc func clearButtonFunc() {
        player1Score = 0
        player2Score = 0
        player3Score = 0
        player1ScoreLabel.text = "score"
        player2ScoreLabel.text = "score"
        player3ScoreLabel.text = "score"
        
        player1ScoreLabel.backgroundColor = globalButtonColor
        player2ScoreLabel.backgroundColor = globalButtonColor
        player3ScoreLabel.backgroundColor = globalButtonColor
    }
    
    @objc func saveButtonFunc() {
        scoreSaveArray.append("\(player1Label.text!) -> \(player1ScoreLabel.text!)  \(player2Label.text!) -> \(player2ScoreLabel.text!) \(player3Label.text!) -> \(player3ScoreLabel.text!)")
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
