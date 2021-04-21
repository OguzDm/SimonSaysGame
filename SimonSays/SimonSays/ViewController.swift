//
//  ViewController.swift
//  SimonSays
//
//  Created by Oguz Demırhan on 21.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var buttonOneOutlet: UIButton!
    @IBOutlet weak var buttonTwoOutlet: UIButton!
    @IBOutlet weak var buttonThreeOutlet: UIButton!
    @IBOutlet weak var buttonFourOutlet: UIButton!
    @IBOutlet weak var buttonFiveOutlet: UIButton!
    @IBOutlet weak var buttonSixOutlet: UIButton!
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    
    var userTapArray = [Int]()
    var activeSequenceArray = [Int]()
    var isGameActive = false
    var isSameArray = false
    var normalColors = [UIColor.systemRed,UIColor.systemYellow,UIColor.systemPurple,UIColor.systemGreen,UIColor.systemOrange,UIColor.systemTeal]
    
    let youWinAlert = UIAlertController(title: "You Win", message: "Congratulations You Win", preferredStyle: .alert)
    let youLoseAlert = UIAlertController(title: "You Lose", message: "Unfortunately You Lose", preferredStyle: .alert)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonOneOutlet.layer.cornerRadius = 12
        buttonTwoOutlet.layer.cornerRadius = 12
        buttonThreeOutlet.layer.cornerRadius = 12
        buttonFourOutlet.layer.cornerRadius = 12
        buttonFiveOutlet.layer.cornerRadius = 12
        buttonSixOutlet.layer.cornerRadius = 12
        
        
        startButtonOutlet.layer.cornerRadius = 8
        startButtonOutlet.layer.borderWidth = 1.0
        startButtonOutlet.layer.borderColor = UIColor.white.cgColor
        youWinAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.restartGame()
        }))
        
        youLoseAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.restartGame()
        }))
        
        
        
    }
    
    
    @IBAction func buttonOneWasPressed(_ sender: UIButton) {
        
        colorfulButtonWasPressed(tag: sender.tag)
        
    }
    
    
    @IBAction func buttonTwoWasPressed(_ sender: UIButton) {
        
        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func buttonThreeWasPressed(_ sender: UIButton) {
        
        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func buttonFourWasPressed(_ sender: UIButton) {
        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func buttonFiveWasPressed(_ sender: UIButton) {
        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func buttonSixWasPressed(_ sender: UIButton) {

        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func startButtonWasPressed(_ sender: UIButton) {
        let sequenceTags = simonSays()
        activeSequenceArray = sequenceTags
        let shuffledColors = normalColors.shuffled()
        
        for i in 0..<sequenceTags.count {
            let tempButton = self.view.viewWithTag(sequenceTags[i]) as? UIButton
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 * Double(i)) {
                
                tempButton?.backgroundColor = shuffledColors[i]
                
               
                
            }
               
          
        }
        
    }
    
    
    func simonSays() -> [Int] {
        
        isGameActive = true
        
        startButtonOutlet.isHidden = true
        
        print("Simon Says")
        let simonSaysNumber = [4,1,2,3,5,6]
        
        
        return simonSaysNumber.shuffled()
    }
    
    func playerTap(tag:Int) {
        
        userTapArray.append(tag)
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    func restartGame() {
        startButtonOutlet.isHidden = false
        
        buttonOneOutlet.backgroundColor = .systemBackground
        buttonTwoOutlet.backgroundColor = .systemBackground
        buttonThreeOutlet.backgroundColor = .systemBackground
        buttonFourOutlet.backgroundColor = .systemBackground
        buttonFiveOutlet.backgroundColor = .systemBackground
        buttonSixOutlet.backgroundColor = .systemBackground
        
        userTapArray.removeAll()
        
    }
    
    func colorfulButtonWasPressed(tag: Int){
        playerTap(tag: tag)
        
        if activeSequenceArray.count == userTapArray.count {
            
            for i in 0..<activeSequenceArray.count {
                
                if activeSequenceArray[i] != userTapArray[i] {
                    
                    DispatchQueue.main.async {
                        self.present(self.youLoseAlert, animated: true, completion: nil)
                    }
                    
                  

                    break
                }
            }
            DispatchQueue.main.async {
                self.present(self.youWinAlert, animated: true, completion: nil)
            }
        }
    }
    

}

