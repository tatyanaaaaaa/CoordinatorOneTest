//
//  DetailScreenCoordinator.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 19.04.2022.
//

import UIKit

final class DetailScreenCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let detailScreen = DetailScreenAssembly().createModule()
        navigationController.pushViewController(detailScreen, animated: true)
    }
}
