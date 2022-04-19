//
//  MainScreenAssembly.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 18.04.2022.
//

import UIKit

final class MainScreenAssembly {
    func createModule() -> MainScreenModule {
        let view = MainScreenView()
        let interactor = MainScreenInteractor()
        let factory = MainScreenFactory()
        let presenter = MainScreenViewController(moduleView: view,
                                                 interactor: interactor,
                                                 factory: factory)
        view.output = presenter
        interactor.output = presenter
        factory.output = presenter
        return presenter
    }
}
