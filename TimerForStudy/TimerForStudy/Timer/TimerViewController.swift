//
//  TimerViewController.swift
//  TimerForStudy
//
//  Created by 김동욱 on 2022/12/11.
//

import UIKit
import Lottie

class TimerViewController: UIViewController {

    let timeManager = TimeManager.shared
    let animationView = LottieAnimationView(name: "lottie_sandClock")
    let startButton = UIButton()
    let stopButton = UIButton()
    let timeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProgressView()
        setupButton()

        NotificationCenter.default.addObserver(self, selector: #selector(startProcess), name: NSNotification.Name("TestNotification"), object: nil)
    }
    
    override func viewDidLayoutSubviews() {

    }
    @objc func startProcess(){
        timeLabel.sizeToFit()
        UIView().displayToast(timeManager.passTimeStr ?? "NIL!!!" + "초 경과")
    }
    private func configureProgressView(){
        self.animationView.backgroundColor = .systemGray6
        // 1. Set animation content mode
        
        self.animationView.contentMode = .scaleAspectFit
        
        // 2. Set animation loop mode
        
        self.animationView.loopMode = .loop
        
        // 3. Adjust animation speed
        
        self.animationView.animationSpeed = 0.8
        
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        timeLabel.text = "시간 표시 레이블"
        timeLabel.backgroundColor = .red
        // 4. Play animation
        self.view.addSubview(self.animationView)
        self.view.addSubview(timeLabel)
        
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.animationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.animationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.animationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            timeLabel.centerXAnchor.constraint(equalTo: self.animationView.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: self.animationView.centerYAnchor)
        ])
        
    }
    @objc func startTimer(){
//        timeManager.startTimer() // testcode
        self.animationView.play()
    }
    
    @objc func stopTimer(){
        self.animationView.pause()
    }
    func setupButton(){
        startButton.setTitle("start", for: .normal)
        stopButton.setTitle("stop", for: .normal)
        startButton.backgroundColor = .red
        stopButton.backgroundColor = .red
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        
        startButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        [startButton, stopButton].forEach {
            self.view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150),
            stopButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150),
            startButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50 ),
            stopButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.backgroundColor = .systemBackground
    }
    
    
}
