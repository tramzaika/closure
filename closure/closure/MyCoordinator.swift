//
//  MyCoordinator.swift
//  closure
//
//  Created by Elizaveta Volkova on 26.07.2021.
//

import UIKit


public protocol CoordinatorProtocol {
    
    func startFlow(scene: UIWindowScene)
}

final class MyCoordinator: CoordinatorProtocol {
        
    var window: UIWindow?
    let redController = RedViewController()
    let blueController = BlueViewController ()
    let greenController = GreenViewController ()
    
    func startFlow(scene windowScene: UIWindowScene) {
        
        let window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Color")
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
        
        guard let startViewController = viewController as? ColorViewController else { return }
        
        startViewController.configureWith { [weak self] vc in
            guard let self = self else { return }
            vc.present(self.redController, animated: false)
        } clo2: { [weak self] vc in
            guard let self = self else { return }
            vc.present(self.blueController, animated: false)
        } clo3: { [weak self] vc in
            guard let self = self else { return }
            vc.present(self.greenController, animated: false)
        }
    }
}
