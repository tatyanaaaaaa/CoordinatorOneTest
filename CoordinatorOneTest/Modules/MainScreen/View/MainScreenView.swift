//
//  MainScreenView.swift
//  CoordinatorOneTest
//
//  Created by Tatiana Sosina on 18.04.2022.
//

import UIKit

protocol MainScreenViewOutput: AnyObject {
    func presentNewScreenButtonAction()
}

protocol MainScreenViewInput: AnyObject {
    
    /// Изменить цвет экрана
    func changeBackgroundColor()
    
    /// Устанавливает текст
    /// - Parameters text :  текст для titleLable
    func setTitle(text: String)
}

final class MainScreenView: UIView, MainScreenViewInput {

    weak var output: MainScreenViewOutput?
    
    private let titleLable = UILabel()
    private let presentNewScreenButton = UIButton()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupConstraints()
        setupDefaultSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func changeBackgroundColor() {
        backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1), alpha: 1)
    }
    
    public func setTitle(text: String) {
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

private extension MainScreenView {
    struct Appearents {
        let padding: CGFloat = 50
        let buttonTitle = "Нажми, чтобы изменить цвет фона"
    }
}
