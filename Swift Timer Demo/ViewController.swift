//
//  ViewController.swift
//  Swift Timer Demo
//
//  Created by Andrew Jaffee on 10/30/18.
//
/*
 
 Copyright (c) 2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
*/

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var timerTickTextField: UITextField!
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: - Member properties
    
    // Declare an instance of the Timer class.
    var countingTimer: Timer?
    // Declare an Int to keep track of
    // each time Timer fires/ticks.
    var tickCount = 0
    // Declare Double to specify seconds
    // between Timer ticks.
    let tickRate = 1.0
    // Declare Int to specify total
    // timer ticks possible.
    let totalTicks = 60
    // Declare Float to specify
    // progress bar increments.
    var progressIncrement: Float = 0.0

    // MARK: - UIViewControllerDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // The first tick is always zero ("0").
        timerTickTextField.text = "0"
        // No progress yet.
        progressView.progress = 0.0
        // Calculate the size of progress
        // bar increments (going from 0.0 to 1.0).
        progressIncrement = 1.0 / Float(totalTicks)
    }

    // MARK: - User interactions
    
    @IBAction func startButtonTapped(_ sender: Any) {
        
        // Create and configure the timer for 1.0 second ticks.
        countingTimer = Timer.scheduledTimer(timeInterval: tickRate, target: self, selector: #selector(onTimerTick), userInfo: "Tick: ", repeats: true)
        // Make the timer efficient.
        countingTimer?.tolerance = 0.15
        // Helps UI stay responsive even with timer.
        RunLoop.current.add(countingTimer!, forMode: RunLoop.Mode.common)
        
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        
        // Destroy timer.
        countingTimer?.invalidate()
        
    }
    
    // MARK: - Timer tick handler; called every time timer fires.

    @objc func onTimerTick(timer: Timer) -> Void {
        
        // Get custom data sent from timer.
        let preface = timer.userInfo as? String
        // Move the progress bar along one increment,
        // reflecting another timer tick.
        progressView.progress += progressIncrement
        
        // BOUNDARY: I only let the timer
        // tick for 60 seconds.
        if tickCount >= totalTicks {
            countingTimer?.invalidate() // Destroy timer.
            timerTickTextField.text = "DONE"
        }
        // We haven't hit the boundary, so count
        // the current tick and display.
        else {
            tickCount += 1
            timerTickTextField.text = preface! + String(tickCount)
        }
        
    } // end func onTimerTick
    
} // end class ViewController

