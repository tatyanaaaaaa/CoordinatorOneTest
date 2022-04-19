//
//  MainScreenViewController.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 18.04.2022.
//

import UIKit

/// события которые отправляем из `ТЕКУЩЕГО МОДУЛЯ` в  `ДРУГОЙ МОДУЛЬ`
protocol MainScreenModuleOutput: AnyObject {
    
    // Comment
    func presentNewScreenButtonAction()
}

/// события которые отправляем из `ДРУГОГО МОДУЛЯ` в  `ТЕКУЩИЙ МОДУЛЬ`
protocol MainScreenModuleInput {
    
    /// Обработчик событий от `Главного экрана`
    var moduleOutput: MainScreenModuleOutput? { get set }
}

typealias MainScreenModule = UIViewController & MainScreenModuleInput

final class MainScreenViewController: MainScreenModule {
    
    weak var moduleOutput: MainScreenModuleOutput?
    
    private let moduleView: MainScreenViewInput & UIView
    private let interactor: MainScreenInteractorInput
    private let factory: MainScreenFactoryInput
    
    init(moduleView: MainScreenViewInput & UIView, interactor: MainScreenInteractorInput, factory: MainScreenFactoryInput) {
        self.moduleView = moduleView
        self.interactor = interactor
        self.factory = factory
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.getContent()
        title = Appearents().title
    }
}

extension MainScreenViewController: MainScreenViewOutput {
    func presentNewScreenButtonAction() {
        moduleOutput?.presentNewScreenButtonAction()
//        moduleView.changeBackgroundColor()
    }
}

extension MainScreenViewController: MainScreenInteractorOutput {
    func didResive(text: String) {
        factory.createTitle(text: text)
    }
}

extension MainScreenViewController: MainScreenFactoryOutput {
    func didResiveFull(text: String) {
        moduleView.setTitle(text: text)
    }
}

private extension MainScreenViewController {
    struct Appearents {
        let title = "Title"
    }
}
