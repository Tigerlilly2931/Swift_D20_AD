//
//  ViewController.swift
//  Swift_D20_AD
//
//  Created by Alissa Davis on 11/15/22.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGoPressed(){
        rollDice()
    }
    
    func rollDice(){
        //let soundDir: URL = Bundle.main.url(forResource: "diceroll", withExtension: "mp3")!
        var soundDir = Bundle.main.path(forResource: "rolldice", ofType: "mp3")!
        //let player = AVPlayer(url: soundDir)
        var url = URL(fileURLWithPath: soundDir)
        
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch{
            print("Audio no worky")
        }
        
        print("Kachicka kaching")
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        if(rolledNumber==1){
            textLabel.text = "Loser"
             soundDir = Bundle.main.path(forResource: "failwah", ofType: "mp3")!
             url = URL(fileURLWithPath: soundDir)
        } else if(rolledNumber==20){
            textLabel.text = "Winner"
             soundDir = Bundle.main.path(forResource: "zfanfare", ofType: "mp3")!
             url = URL(fileURLWithPath: soundDir)
        }else{
            textLabel.text = String(rolledNumber)
        }
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch{
            print("Audio no worky")
        }
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if(motion == .motionShake){
            rollDice()
        }
    }

}

