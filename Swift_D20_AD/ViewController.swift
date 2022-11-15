//
//  ViewController.swift
//  Swift_D20_AD
//
//  Created by Alissa Davis on 11/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGoPressed(){
        rollDice()
    }
    
    func rollDice(){
        print("Kachicka kaching")
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        if(rolledNumber==1){
            textLabel.text = "Loser"
        } else if(rolledNumber==20){
            textLabel.text = "Winner"
        }else{
            textLabel.text = String(rolledNumber)
        }
        
    }

}

