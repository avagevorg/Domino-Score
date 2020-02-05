//
//  FirstViewController.swift
//  DominoScore
//
//  Created by Gevorg Avagyan on 7/19/19.
//  Copyright © 2019 Gevorg Avagyan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var team1TextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var team2TextField: UITextField!
    @IBOutlet weak var player3TextField: UITextField!
    @IBOutlet weak var twoPlayerButton: UIButton!
    @IBOutlet weak var threePlayerButton: UIButton!
    @IBOutlet weak var fourPlayerButton: UIButton!
    
    var playerCount = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let infoButton = UIBarButtonItem.init(title: "Info", style: UIBarButtonItem.Style.plain, target: self, action: #selector(infoButtonFunc))
        let savedButton = UIBarButtonItem.init(title: "Saved", style: UIBarButtonItem.Style.plain, target: self, action: #selector(savedButtonFunc))
        
        rgbArray = UserDefaults.standard.array(forKey: "rgb")  as? [[CGFloat]] ?? ([[CGFloat(19.0/255.0), CGFloat(37.0/255.0), CGFloat(145.0/255.0)], [CGFloat(20.0/255.0), CGFloat(13.0/255.0), CGFloat(5.0/255.0)], [CGFloat(19.0/255.0), CGFloat(37.0/255.0), CGFloat(145.0/255.0)]])
        
        
        
        globalBackgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        globalButtonColor = UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        globalTextColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1)

       
        self.navigationItem.rightBarButtonItem = infoButton
        self.navigationItem.leftBarButtonItem = savedButton
        scoreSaveArray = UserDefaults.standard.stringArray(forKey: "saved") ?? [String]()
        nameLabel.layer.cornerRadius = 20
        fourPlayerButton.isSelected = true
    }
    
    @IBAction func playerCountButton(_ sender: UIButton) {
        if sender.tag == 2 {
            team1TextField.placeholder = "Player 1 name"
            team2TextField.placeholder = "Player 2 name"
            player3TextField.isHidden = true
            sender.isSelected = true
            threePlayerButton.isSelected = false
            fourPlayerButton.isSelected = false
            playerCount = 2
        }
        if sender.tag == 3 {
            team1TextField.placeholder = "Player 1 name"
            team2TextField.placeholder = "Player 2 name"
            player3TextField.isHidden = false
            sender.isSelected = true
            twoPlayerButton.isSelected = false
            fourPlayerButton.isSelected = false
            playerCount = 3
        }
        if sender.tag == 4 {
            team1TextField.placeholder = "Team 1 name"
            team2TextField.placeholder = "Team 2 name"
            player3TextField.isHidden = true
            sender.isSelected = true
            twoPlayerButton.isSelected = false
            threePlayerButton.isSelected = false
            playerCount = 4
        }
    }
    
    
    @IBAction func startButton(_ sender: UIButton) {
        if playerCount == 4 {

            let vc = storyboard?.instantiateViewController(withIdentifier: "mainVCID") as! ViewController
            vc.team1Name = team1TextField.text == "" ? "Team 1" : team1TextField.text!
            vc.team2Name = team2TextField.text == "" ? "Team 2" : team2TextField.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if playerCount == 3 {

            let vc = storyboard?.instantiateViewController(withIdentifier: "threePlayerVC") as! ThreePlayerViewController
            vc.player1Name = team1TextField.text == "" ? "Player 1" : team1TextField.text!
            vc.player2Name = team2TextField.text == "" ? "Player 2" : team2TextField.text!
            vc.player3Name = player3TextField.text == "" ? "Player 3" : team2TextField.text!
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if playerCount == 2 {

            let vc = storyboard?.instantiateViewController(withIdentifier: "mainVCID") as! ViewController
            vc.team1Name = team1TextField.text == "" ? "Player 1" : team1TextField.text!
            vc.team2Name = team2TextField.text == "" ? "Player 2" : team2TextField.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func infoButtonFunc() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "infoVCID") as! InfoViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func savedButtonFunc() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "savedVCID") as! SavedViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension Notification.Name {
    static let name = Notification.Name("name")
}
