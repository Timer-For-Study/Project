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
    let progressView = LottieAnimationView(name: "progress")
    let startButton = UIButton()
    let stopButton = UIButton()
    let timeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(startProcess), name: NSNotification.Name("TestNotification"), object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        setupButton()
        startTimer()
        configureProgressView()
    }
    @objc func startProcess(){
        timeLabel.text = timeManager.passTimeStr
        timeLabel.sizeToFit()
        UIView().displayToast(timeManager.passTimeStr ?? "NIL!!!" + "초 경과")
    }
    private func configureProgressView(){
        
        // 1. Set animation content mode
        
        progressView.contentMode = .scaleAspectFit
        
        // 2. Set animation loop mode
        
        progressView.loopMode = .loop
        
        // 3. Adjust animation speed
        
        progressView.animationSpeed = 0.8
        
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        
        timeLabel.backgroundColor = .red
        // 4. Play animation
        self.view.addSubview(progressView)
        self.view.addSubview(timeLabel)
        
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.progressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            progressView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            timeLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor)
        ])
        
    }
    @objc func startTimer(){
        timeManager.startTimer() // testcode

        progressView.play()
    }
    
    @objc func stopTimer(){
        self.progressView.pause()
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
        self.view.backgroundColor = .systemMint
    }
    
    
}
