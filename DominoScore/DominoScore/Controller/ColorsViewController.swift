//
//  ColorsViewController.swift
//  DominoScore
//
//  Created by Gevorg Avagyan on 12/16/19.
//  Copyright © 2019 Gevorg Avagyan. All rights reserved.
//

import UIKit


var rgbArray = [[CGFloat(19.0/255.0), CGFloat(37.0/255.0), CGFloat(145.0/255.0)], [CGFloat(20.0/255.0), CGFloat(13.0/255.0), CGFloat(5.0/255.0)], [CGFloat(19.0/255.0), CGFloat(37.0/255.0), CGFloat(145.0/255.0)]]

var globalBackgroundColor = UIColor()
var globalButtonColor = UIColor()
var globalTextColor = UIColor()

class ColorsViewController: UIViewController {
    
    
    @IBOutlet weak var example: UIButton!
    
    @IBOutlet var sliders: [UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultButton = UIBarButtonItem.init(title: "Default", style: UIBarButtonItem.Style.plain, target: self, action: #selector(defaultButtonFunc))
        self.navigationItem.rightBarButtonItem = defaultButton
        for i in 0..<sliders.count {
            if i >= 0 && i <= 2 {
                sliders[i].setValue(Float(rgbArray[0][i]), animated: true)
            }
            if i >= 3 && i <= 5 {
                sliders[i].setValue(Float(rgbArray[1][i-3]), animated: true)
            }
            if i >= 6 && i <= 8 {
                sliders[i].setValue(Float(rgbArray[2][i-6]), animated: true)
            }
        }
        
        self.view.backgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        example.backgroundColor =  UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        example.titleLabel?.textColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1)
    }
    @objc func defaultButtonFunc() {
        rgbArray = [[CGFloat(19.0/255.0), CGFloat(37.0/255.0), CGFloat(145.0/255.0)], [CGFloat(20.0/255.0), CGFloat(13.0/255.0), CGFloat(5.0/255.0)], [CGFloat(19.0/255.0), CGFloat(37.0/255.0), CGFloat(145.0/255.0)]]
        for i in 0..<sliders.count {
            if i >= 0 && i <= 2 {
                sliders[i].setValue(Float(rgbArray[0][i]), animated: true)
            }
            if i >= 3 && i <= 5 {
                sliders[i].setValue(Float(rgbArray[1][i-3]), animated: true)
            }
            if i >= 6 && i <= 8 {
                sliders[i].setValue(Float(rgbArray[2][i-6]), animated: true)
            }
        }
        globalBackgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        globalButtonColor = UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        globalTextColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1)
        self.view.backgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        example.backgroundColor =  UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        example.titleLabel?.textColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1)
    }
    
    
    @IBAction func backgroundColor(_ sender: UISlider) {
        if sender.tag == 1 {
            rgbArray[0][0] = CGFloat(sender.value)
        }
        if sender.tag == 2 {
            rgbArray[0][1] = CGFloat(sender.value)
        }
        if sender.tag == 3 {
            rgbArray[0][2] = CGFloat(sender.value)
        }
        
        globalBackgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        self.view.backgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        
    }
    
    @IBAction func dotColor(_ sender: UISlider) {
        if sender.tag == 1 {
            rgbArray[1][0] = CGFloat(sender.value)
        }
        if sender.tag == 2 {
            rgbArray[1][1] = CGFloat(sender.value)
        }
        if sender.tag == 3 {
            rgbArray[1][2] = CGFloat(sender.value)
        }
        example.backgroundColor = UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        globalButtonColor = UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
    }
    
    
    @IBAction func dotCornerColor(_ sender: UISlider) {
        if sender.tag == 1 {
            rgbArray[2][0] = CGFloat(sender.value)
        }
        if sender.tag == 2 {
            rgbArray[2][1] = CGFloat(sender.value)
        }
        if sender.tag == 3 {
            rgbArray[2][2] = CGFloat(sender.value)
        }
        example.titleLabel?.textColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1)
        globalTextColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1)
        
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        UserDefaults.standard.set(rgbArray, forKey: "rgb")
        let alert = UIAlertController(title: "Saved", message: "Your colors successfully has been saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            UIAlertAction in
            self.navigationController?.popViewController(animated: true) }))
        self.present(alert, animated: true, completion: nil)

//        self.navigationController?.popViewController(animated: true)
        
    }
    
}

