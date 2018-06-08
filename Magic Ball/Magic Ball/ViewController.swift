//
//  ViewController.swift
//  Magic Ball
//
//  Created by Baris Cem Baykara on 10/31/17.
//  Copyright © 2017 Baris Cem Baykara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var askButton: UIButton!
    @IBOutlet weak var ballAnswer: UILabel!
   
    let answers = ["Yes", "No", "Maybe", "IDK", "What?", "Fuck Off!", "Get over her/him", "Whatever", "Totally", "Give it time", "Nope", "Hell Yeah", "Sometimes", "Never", "Get rich, fuck bitches"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballAnswer.text = "Ask me something"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func askButton(_ sender: Any) {
        answerMe()
    }
    
    func answerMe() {
        let chooseRandom = Int(arc4random_uniform(UInt32(answers.count)))
        ballAnswer.text = answers[chooseRandom]
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        answerMe()
    }

}

