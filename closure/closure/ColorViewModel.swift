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
            return
        }
        if state == 2 {
            self.completionTwo!()
            return
        }
        if state == 3 {
            self.completionThree!()
            return
        }
     }

    func changeState() {
        
        state += 1
        if state > 3 {
            state = 1
        }
    }

    func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            self?.changeState()
        }
    }
}
