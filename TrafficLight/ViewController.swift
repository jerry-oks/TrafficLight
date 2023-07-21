//
//  ViewController.swift
//  TrafficLight
//
//  Created by HOLY NADRUGANTIX on 20.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    private enum State {
        case red
        case yellow
        case green
        case off
    }
    
    private var state: State = .off
    
    @IBOutlet var redSignalView: UIView!
    @IBOutlet var yellowSignalView: UIView!
    @IBOutlet var greenSignalView: UIView!
    @IBOutlet var stopSignalView: UIImageView!
    @IBOutlet var goSignalView: UIImageView!
    @IBOutlet var startNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSignalView.layer.cornerRadius = redSignalView.frame.width / 2
        yellowSignalView.layer.cornerRadius = yellowSignalView.frame.width / 2
        greenSignalView.layer.cornerRadius = greenSignalView.frame.width / 2
        startNextButton.layer.cornerRadius = 4
    }
    
    private func resetTrafficLight() {
        let signalViews = [
            redSignalView,
            yellowSignalView,
            greenSignalView,
            stopSignalView,
            goSignalView
        ]
        
        signalViews.forEach { $0?.alpha = 0.3 }
    }
    
    @IBAction func startNextButtonDidTap() {
        func turnOn(_ signalView: UIView) {
            resetTrafficLight()

            signalView.alpha = 1
            
            if signalView == redSignalView {
                goSignalView.alpha = 1
            } else {
                stopSignalView.alpha = 1
            }
        }
        
        switch state {
        case .red:
            turnOn(yellowSignalView)
            state = .yellow
        case .yellow:
            turnOn(greenSignalView)
            state = .green
        case .off:
            startNextButton.setTitle("Next", for: .normal)
            fallthrough
        case .green:
            turnOn(redSignalView)
            state = .red
        }
    }
}

