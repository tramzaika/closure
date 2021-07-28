//
//  ViewController.swift
//  closure
//
//  Created by Elizaveta Volkova on 17.07.2021.
//

import UIKit

class ColorViewController: UIViewController {
    
    let viewModel = ColorViewModel()
    
    @IBOutlet weak var pleaseTapButton: UIButton!
    
    @IBAction func tapMe(_ sender: Any) {
        
        viewModel.buttonTapped()
    }
       
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel.startTimer()
    }
    
    func configureWith(clo1 : @escaping (UIViewController) -> (), clo2: @escaping (UIViewController) -> (), clo3: @escaping (UIViewController) -> ()) {
        
        viewModel.completionOne = {clo1 (self)}
        viewModel.completionTwo = {clo2 (self)}
        viewModel.completionThree = {clo3 (self)}
    }
}

