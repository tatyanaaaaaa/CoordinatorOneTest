//
//  MainScreenFactory.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 18.04.2022.
//

import UIKit

protocol MainScreenFactoryOutput: AnyObject {
    
    /// Были получены данные
    /// - Parameters text: готовый сформатированный 'текст'
    func didResiveFull(text: String)
}

protocol MainScreenFactoryInput: AnyObject {
    
    /// Создает секции для отображения
    ///  - Parameters text :  'вторая часть готового текста'
    func createTitle(text: String)
}

final class MainScreenFactory: MainScreenFactoryInput {
    
    weak var output: MainScreenFactoryOutput?

    func createTitle(text: String) {
        let fullText = "\(Appearents().title) \(text)"
        output?.didResiveFull(text: fullText)
    }
    
}

private extension MainScreenFactory {
    struct Appearents {
        let title = "Hello,"
    }
}
