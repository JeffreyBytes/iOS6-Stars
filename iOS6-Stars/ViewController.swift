//
//  ViewController.swift
//  iOS6-Stars
//
//  Created by Jeffrey Carpenter on 4/30/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var starNameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var starsListTextView: UITextView!
    
    let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listStars()
    }
    
    @IBAction func addStarButtonPressed(_ sender: UIButton) {
        
        guard let name = starNameTextField.text,
        let distance = distanceTextField.text,
        !name.isEmpty,
        let distanceDouble = Double(distance)
        else { return }
        
        starController.addStar(named: name, withDistance: distanceDouble)
        
        listStars()
    }
    
    // List all of the stars we are tracking
    func listStars() {
        
        // Create a string, append text about each star, display it in the TextView
        var output = ""
        
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) lightyears away.\n"
        }
        
        starsListTextView.text = output
    }
}

