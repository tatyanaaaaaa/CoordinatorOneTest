//
//  DetailScreenView.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 18.04.2022.
//

import UIKit

protocol DetailScreenViewOutput: AnyObject {
    
    /// Кнопка была нажата пользователем
    func presentNewScreenButtonAction()
}
protocol DetailScreenViewInput: AnyObject {
    
    /// Измненение цвета экрана
    ///  - Parameters color : Меняет цвет экрана
    func changeBacgroundColor(color: UIColor?)
    
    /// Устанавливает текст
    /// - Parameters text
    func setupTitle(text: String)
}

final class DetailScreenView: UIView, DetailScreenViewInput {
  
    weak var output: DetailScreenViewOutput?
    
    private let titleLable = UILabel()
    private let presentNewScreenButton = UIButton()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
        setupConstraints()
        setupDefaultSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeBacgroundColor(color: UIColor?) {
        guard let color = color else {return}
        backgroundColor = color
    }
    
    func setupTitle(text: String) {
        titleLable.text = text
    }
    
    private func setupConstraints() {
        [titleLable, presentNewScreenButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        NSLayoutConstraint.activate([
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLable.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().padding),
            presentNewScreenButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            presentNewScreenButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupDefaultSettings() {
        backgroundColor = .white
        
        presentNewScreenButton.setTitleColor(.blue, for: .normal)
        presentNewScreenButton.setTitle(Appearents().buttonTitle, for: .normal)
        presentNewScreenButton.addTarget(self, action: #selector(presentNewScreenButtonAction), for: .touchUpInside)
    }
    
    @objc func presentNewScreenButtonAction() {
        output?.presentNewScreenButtonAction()
    }
    
}
private extension DetailScreenView {
    struct Appearents {
        let buttonTitle = "Закрыть экран"
        let padding: CGFloat = 50
    }
}
