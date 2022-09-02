//
//  SearchViewController.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 01.09.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.alwaysBounceVertical = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.allowsMultipleSelection = false
        tableView.isExclusiveTouch = true
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var viewModel: SearchViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        bindViews()
    }
    
}

//MARK: - private methods
private extension SearchViewController {
    
    func setupViews() {
        view.addSubviews([
            tableView
        ])
        configureSearchController()
        self.tableView.register(RepositoryCell.self,
                                forCellReuseIdentifier: String(describing: RepositoryCell.self))
        view.backgroundColor = .black
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor)
            
        ])
    }
    
    func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.text = ""
        searchBar.tintColor = .white
        searchBar.placeholder = "Repository name"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    func bindViews() {
        viewModel.data
            .drive(tableView.rx.items(cellIdentifier: String(describing: RepositoryCell.self))) { _, repository, cell in
                guard let cell = cell as? RepositoryCell else { return }
                cell.repoTitleLabel.text = repository.repoName
                cell.repoSupTitleLabel.text = repository.repoURL
            }
            .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
    }
    
}
