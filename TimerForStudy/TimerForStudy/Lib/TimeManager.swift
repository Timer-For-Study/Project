//
//  InTimer.swift
//  TimerForStudy
//
//  Created by 유준용 on 2022/12/13.
//

import Foundation
import UIKit

final class TimeManager {
    enum SessionState: Double {
        case ready
        case paused
        case timing
    }
    static let shared = TimeManager()
    
    private(set) var timer = Timer()
    var passTime: TimeInterval?
    var passTimeStr: String?
    var startTime: Date?
    
    // pomodoro properties
    var status = false // false: 휴식, true: 집중
    var breakTime: Int?
    var focusTime: Int?
    
    
    private init(){
        self.startTime = Date.now
    }
    
    // Timer Scheduler Test Code
    @objc func toast(){
        
        
        
    }
    
    public func resetTimer(){
        if self.timer.isValid {
            self.timer.invalidate()
        }
        self.passTime = nil
    }
    
    public func startTimer(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.passTime = round(self.startTime?.timeIntervalSinceNow ?? 0.0) * -1
            NotificationCenter.default.post(name: NSNotification.Name("TestNotification"), object: nil)
            guard let time = self.passTime else{return}
            
            let timeStr = String(time)
            self.passTimeStr = timeStr
        }
        
        
    }
    
}
