//
//  SettingsViewController.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 02.09.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class SettingsViewController: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "GithubID"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.textColor = .white
        textField.tintColor = .white
        textField.text = settingsViewModel.name.value
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.textAlignment = .center
        textField.layer.borderColor = UIColor.white.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var settingsViewModel: SettingsViewModel!
    let disposeBag = DisposeBag()

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupBindings()
    }

}

// MARK: - private methods
private extension SettingsViewController {
    
    func setupViews() {
        view.addSubviews([
            nameLabel,
            nameField
        ])
        view.backgroundColor = .black
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameField.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -16),
            nameField.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -16),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupBindings() {
        nameField.rx.text.orEmpty
            .bind(to: settingsViewModel.name)
            .disposed(by: disposeBag)
    }
    
}


