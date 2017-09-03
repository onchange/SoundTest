//
//  ViewController.swift
//  SoundTest
//
//  Created by onchange on 2017/09/03.
//  Copyright © 2017年 onchange. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController ,AVSpeechSynthesizerDelegate{
    var talker = AVSpeechSynthesizer()
    let script1 = "The pen is mightier than the sword."
    let lang = "en-US"
    //let lang = "ja-JP"
    //let script1 = "あめんぼあかいなあいうえお"
    
    @IBOutlet weak var scriptLabel: UILabel!
    @IBOutlet weak var originalScript: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.talker.delegate = self
 
        originalScript.text = script1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("start")
        
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("end")
        self.scriptLabel.text = "..."
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let word = (utterance.speechString as NSString).substring(with: characterRange)
        
        self.scriptLabel.text = word
        print("\(word)")
    }
 
    
    @IBAction func speech(_ sender: Any) {
        self.talker.speak(createUt(script1))
    }

    
    private func createUt(_ str:String)-> AVSpeechUtterance{
        let utterance = AVSpeechUtterance(string: str)
        utterance.voice = AVSpeechSynthesisVoice(language: self.lang)
    utterance.rate = AVSpeechUtteranceMinimumSpeechRate
        utterance.volume = 0
        return utterance
    }

}

