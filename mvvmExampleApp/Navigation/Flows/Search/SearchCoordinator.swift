//
//  SearchCoordinator.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 01.09.2022.
//

import Foundation

final class SearchCoordinator: BaseCoordinator, SearchCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    fileprivate let router : Routable
    
    init(router: Routable) {
        self.router  = router
    }
}

// MARK:- Coordinatable
extension SearchCoordinator: Coordinatable {
    func start() {}
}
