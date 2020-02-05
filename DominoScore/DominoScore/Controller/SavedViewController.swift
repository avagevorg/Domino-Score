//
//  SavedViewController.swift
//  DominoScore
//
//  Created by Gevorg Avagyan on 7/26/19.
//  Copyright © 2019 Gevorg Avagyan. All rights reserved.
//

import UIKit

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class SavedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var savedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Saved"
        
        savedTableView.delegate = self
        savedTableView.dataSource = self
        if scoreSaveArray.count == 0 {
            savedTableView.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreSaveArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "savedCell")
        cell.layer.cornerRadius = 15
        cell.selectionStyle = .none
        cell.backgroundColor = hexStringToUIColor(hex: "#132591")
        cell.textLabel?.text = "\(scoreSaveArray[indexPath.row])"
        return cell
        
    }
    

}
