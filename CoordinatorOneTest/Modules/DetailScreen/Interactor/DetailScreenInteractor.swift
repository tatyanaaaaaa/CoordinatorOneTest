//
//  DetailScreenInteractor.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 18.04.2022.
//

import UIKit

protocol DetailScreenInteractorOutput: AnyObject {
    
    /// Данные были получены
    /// - Parameters text : текст
    func didRecive(text: String)
}
protocol DetailScreenInteractorInput: AnyObject {
    
    /// Загрузить контент
    func getContent()
}

final class DetailScreenInteractor: DetailScreenInteractorInput {

    weak var output: DetailScreenInteractorOutput?

    func getContent() {
        output?.didRecive(text: Appearents().text)
    }
}

private extension DetailScreenInteractor {
    struct Appearents {
        let text = "New screen"
    }
}
