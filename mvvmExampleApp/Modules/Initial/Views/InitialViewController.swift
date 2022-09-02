//
//  InitialViewController.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 31.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class InitialViewController: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "GithubID"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.textAlignment = .center
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var initialViewModel: InitialViewModel!
    let disposeBag = DisposeBag()
    
    var goNext: CompletionBlock?

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupBindings()
    }

}

// MARK: - private methods
private extension InitialViewController {
    
    func setupViews() {
        view.addSubviews([
            nameLabel,
            nameField,
            nextButton
        ])
        view.backgroundColor = .white
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameField.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -16),
            nameField.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -16),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -16),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setupBindings() {
        nextButton.rx.tap.subscribe { [weak self] _ in
            guard let self = self else { return }
            self.goNext?()
        }.disposed(by: disposeBag)
        
        nameField.rx.text.orEmpty
            .bind(to: initialViewModel.name)
            .disposed(by: disposeBag)
        
        initialViewModel.isHiddenNextButton.subscribe { [weak self] (event) in
            guard let self = self,
                  let isHidden = event.element else { return }
            self.nextButton.isHidden = isHidden
        }.disposed(by: disposeBag)
    }
    
}

