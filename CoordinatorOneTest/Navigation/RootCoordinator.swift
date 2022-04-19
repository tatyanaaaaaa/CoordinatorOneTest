//
//  RootCoordinator.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 19.04.2022.
//

import UIKit

final class RootCoordinator: Coordinator {
    
    let window: UIWindow
    let navigationController = UINavigationController()
    var mainScreenCoordinator: Coordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mainScreenCoordinator: Coordinator = MainScreenCoordinator(navigationController: navigationController)
        self.mainScreenCoordinator = mainScreenCoordinator
        mainScreenCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
