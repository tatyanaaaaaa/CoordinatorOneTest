//
//  MainScreenInteractor.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 18.04.2022.
//

import UIKit

protocol MainScreenInteractorOutput: AnyObject {
    
    /// Были получены данные
    /// - Parameter text : текст
    func didResive(text: String)
}

protocol MainScreenInteractorInput: AnyObject {
    
    /// Загрузить контент
    func getContent()
}

final class MainScreenInteractor: MainScreenInteractorInput {

    weak var output: MainScreenInteractorOutput?

    public func getContent() {
        output?.didResive(text: Appearents().someText)
    }
}

private extension MainScreenInteractor {
    struct Appearents {
        let someText = "world"
    }
}
