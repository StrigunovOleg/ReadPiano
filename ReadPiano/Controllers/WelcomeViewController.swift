//
//  ViewController.swift
//  ReadPiano
//
//  Created by Олег Стригунов on 31.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var chartIndex = 0.0
        let titletText = "🎵Read note"
        
        for letter in titletText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * chartIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            chartIndex += 1
        }
        
    }
    
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
               print("возрат на этот экран с конца приложения")
           }


}

