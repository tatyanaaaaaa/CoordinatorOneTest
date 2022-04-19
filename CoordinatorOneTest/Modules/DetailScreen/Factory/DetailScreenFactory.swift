//
//  DetailScreenFactory.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 18.04.2022.
//

import UIKit

protocol DetailScreenFactoryOutput: AnyObject {
    /// Был получен готовый текст
    /// - Parameters text : готовый текст
    func didResiveFull(text:String)
}
protocol DetailScreenFactoryInput: AnyObject {
    
    /// Изменить текст
    /// - Parameters text : исходный текст
    func createTitle(text: String)
}

final class DetailScreenFactory: DetailScreenFactoryInput {
    
    weak var output: DetailScreenFactoryOutput?

    func createTitle(text: String) {
        let appearents = "\(Appearents().someText) \(text)"
        output?.didResiveFull(text: appearents)
    }
}

private extension DetailScreenFactory {
    struct Appearents {
        let someText = "this - "
    }
}
