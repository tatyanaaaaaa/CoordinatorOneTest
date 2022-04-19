//
//  MainScreenCoordinator.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 19.04.2022.
//

import UIKit

final class MainScreenCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    var detailScreenCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        var mainScreenModule = MainScreenAssembly().createModule()
        mainScreenModule.moduleOutput = self
        navigationController.pushViewController(mainScreenModule, animated: false)
        
    }
    
    private func showDetailScreen() {
        let detailScreenCoordinator: Coordinator = DetailScreenCoordinator(navigationController: navigationController)
        self.detailScreenCoordinator = detailScreenCoordinator
        detailScreenCoordinator.start()
    }
}

extension MainScreenCoordinator: MainScreenModuleOutput {
    func presentNewScreenButtonAction() {
        showDetailScreen()
    }
}
