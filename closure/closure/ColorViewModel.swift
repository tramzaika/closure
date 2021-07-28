//
//  ColorViewModel.swift
//  closure
//
//  Created by Elizaveta Volkova on 17.07.2021.
//

import Foundation

class ColorViewModel {
    
    var state = 1
    weak var timer: Timer?
    
    var completionOne: (() -> ())?
    var completionTwo: (() -> ())?
    var completionThree: (() -> ())?

    func buttonTapped() {
        choisClosureOnState()
    }
    
     func choisClosureOnState() {
        if state == 1 {
            self.completionOne?()
        }
        if state == 2 {
            self.completionTwo!()
        }
        if state == 3 {
            self.completionThree!()
        }
     }

    func changeState() -> Int {
        
        if state == 1 {
        state = 2
            return state
        }
        
        if state == 2 {
            state = 3
            return state
        }
        
        if state == 3 {
        state = 1
            return state
        }
        return state
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            self?.changeState()
        }
    }
}
