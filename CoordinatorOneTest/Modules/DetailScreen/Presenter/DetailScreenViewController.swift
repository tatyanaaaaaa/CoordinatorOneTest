//
//  DetailScreenViewController.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 18.04.2022.
//

import UIKit

protocol DetailScreenModuleOutput: AnyObject {
    
}
protocol DetailScreenViewModuleInput: AnyObject {
    
}

typealias DetailScreenModule = UIViewController & DetailScreenViewModuleInput

final class DetailScreenViewController: DetailScreenModule {
    
    weak var moduleOutput: DetailScreenModuleOutput?
    
    private let moduleView: DetailScreenViewInput & UIView
    private let interactor: DetailScreenInteractorInput
    private let factory: DetailScreenFactoryInput
    
    init(moduleView: DetailScreenViewInput & UIView,interactor: DetailScreenInteractorInput,
         factory: DetailScreenFactoryInput) {
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
    }
}

extension DetailScreenViewController: DetailScreenViewOutput {
    func presentNewScreenButtonAction() {
        
    }
}

extension DetailScreenViewController: DetailScreenInteractorOutput {
    func didRecive(text: String) {
        factory.createTitle(text: text)
    }
}

extension DetailScreenViewController: DetailScreenFactoryOutput {
    func didResiveFull(text: String) {
        moduleView.setupTitle(text: text)
    }
}

private extension DetailScreenViewController {
    struct Appearents {
        let title = "ROUTING to Coordinator"
    }
}
