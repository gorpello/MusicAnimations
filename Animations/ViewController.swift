//
//  ViewController.swift
//  Animations
//
//  Created by Gianluca Orpello on 19/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumImage: UIView!
    
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var palyPauseBackground: UIView!
    @IBOutlet weak var forwardBackground: UIView!
    
    
    var isPlaying: Bool = true {
        didSet{
            if isPlaying {
                playPauseButton.setImage(UIImage(named: "pause")!, for: .normal)
            }else {
                playPauseButton.setImage(UIImage(named: "play")!, for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reverseBackground.layer.cornerRadius = 35.0
        reverseBackground.clipsToBounds = true
        reverseBackground.alpha = 0.0
        
        palyPauseBackground.layer.cornerRadius = 35.0
        palyPauseBackground.clipsToBounds = true
        palyPauseBackground.alpha = 0.0
        
        forwardBackground.layer.cornerRadius = 35.0
        forwardBackground.clipsToBounds = true
        forwardBackground.alpha = 0.0
        
    }

    @IBAction func touchedUpInside(_ sender: UIButton) {
        var background: UIView
        
        switch sender {
            case reverseButton:
                background = reverseBackground
            case playPauseButton:
                background = palyPauseBackground
            case forwardButton:
                background = forwardBackground
            default:
                return
        }
        
        UIView.animate(withDuration: 0.25) {
            
            background.alpha = 0.0
            background.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        } completion: { (completed) in
            background.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
    
        let background: UIView
        
        switch sender {
            case reverseButton:
                background = reverseBackground
            case playPauseButton:
                background = palyPauseBackground
            case forwardButton:
                background = forwardBackground
            default:
                return
        }
        
        UIView.animate(withDuration: 0.25) {
            background.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if isPlaying {
            
            UIView.animate(withDuration: 0.5) {
                self.albumImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            
        }else {
            UIView.animate(withDuration: 0.5) {
                self.albumImage.transform = CGAffineTransform.identity
            }
        }
        
        isPlaying.toggle()
    }
    

}

