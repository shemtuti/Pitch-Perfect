//
//  PlaySoundsViewController.swift
//  Pitch Perfect Project
//
//  Created by Shem Tuti on 19/11/2022.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {case slow = 0, fast, high, low, echo, reverb}
    
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(sender) {
        case slowButton:
            playSound(rate: 0.5)
        case fastButton:
            playSound(rate: 1.5)
        case highPitchButton:
            playSound(pitch: 1000)
        case lowPitchButton:
            playSound(pitch: -1000)
        case echoButton:
            playSound(echo: true)
        case reverbButton:
            playSound(reverb: true)
        default:
            print("Sound not found")
        }
        
        configureUI(.playing)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
        slowButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        fastButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        highPitchButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        lowPitchButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        echoButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        reverbButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopAudio()
    }

    @IBAction func stopListening(_ sender: Any) {
        stopAudio()
    }
}
