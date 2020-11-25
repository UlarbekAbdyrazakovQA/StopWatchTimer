//
//  ViewController.swift
//  StopWatch
//
//  Created by Ularbek Abdyrazakov on 26.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
  

    var timer = Timer()
    var myTimeSeconds = 0
    var myTimeMinutes = 0
    var myTimeHours = 0
    var sseconds = 30
    var checker = false
    
    @IBOutlet weak var Seconds: UILabel!
    @IBOutlet weak var Minutes: UILabel!
    @IBOutlet weak var Hours: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    
    @IBAction func slider(_ sender: UISlider) {
        sseconds = Int(sender.value)
        Seconds.text = String(sseconds)
        
        
    }
   
    @IBAction func forward(_ sender: UIButton) {
        timer.invalidate()
        slider.isHidden = true
        checker = false
        Seconds.text = "00"
        Minutes.text = "00"
        Hours.text = "00"
        myTimeSeconds = 0
        myTimeMinutes = 0
        myTimeHours = 0
      
        
    }
    
    @IBAction func backward(_ sender: UIButton) {
        checker = true
        timer.invalidate()
        slider.isHidden = false
        
        if checker == true{
            Seconds.text = "30"
            Minutes.text = "00"
            Hours.text = "00"
        }
        
    }
    
    
    
    @IBAction func startBtn(_ sender: UIButton) {
        if checker == false{
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        }
        else{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(minus), userInfo: nil, repeats: true)
        }
        
    }
    
    @IBAction func pauseBtn(_ sender: UIButton) {
        timer.invalidate()
    }
    @IBAction func resetBtn(_ sender: UIButton) {
        if checker == false {
            timer.invalidate()
             myTimeSeconds = 0
             myTimeMinutes = 0
             myTimeHours = 0
             Seconds.text = "00"
             Minutes.text = "00"
             Hours.text = "00"
        }
        else{
            timer.invalidate()
           
            myTimeMinutes = 0
            myTimeHours = 0
            sseconds = 30
            Seconds.text = "30"
            Minutes.text = "00"
            Hours.text = "00"
        }
        
    }
    
    @objc func minus(){
        sseconds-=1
        Seconds.text = String(sseconds)
        slider.value = Float(sseconds)
        if sseconds==0 {
            timer.invalidate()
        }
    }
    @objc func action(){
        myTimeSeconds+=1
        Seconds.text = String(myTimeSeconds)
        
        if myTimeSeconds == 60{
            myTimeMinutes+=1
            Minutes.text = String(myTimeMinutes)
            myTimeSeconds = 0
            Seconds.text = "00"
        }
        if myTimeMinutes == 60 {
            myTimeHours+=1
            Hours.text = String(myTimeHours)
            myTimeMinutes = 0
            Minutes.text = "00"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.isHidden = true
        slider.value = 30
       
    }
}

