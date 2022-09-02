//
//  RepositoryCell.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 02.09.2022.
//

import Foundation
import UIKit

final class RepositoryCell: UITableViewCell {
    
    var repoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var repoSupTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

extension RepositoryCell {
    
    func setupViews() {
        self.contentView.addSubviews([
            repoTitleLabel,
            repoSupTitleLabel
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            repoTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            repoTitleLabel.leadingAnchor.constraint(equalTo: contentView.safeLeadingAnchor),
            repoTitleLabel.trailingAnchor.constraint(equalTo: contentView.safeTrailingAnchor),
            
            repoSupTitleLabel.topAnchor.constraint(equalTo: repoTitleLabel.bottomAnchor, constant: 10),
            repoSupTitleLabel.leadingAnchor.constraint(equalTo: contentView.safeLeadingAnchor),
            repoSupTitleLabel.trailingAnchor.constraint(equalTo: contentView.safeTrailingAnchor),
            repoSupTitleLabel.bottomAnchor.constraint(equalTo: contentView.safeBottomAnchor, constant: -16)
            
        ])
    }
    
}

