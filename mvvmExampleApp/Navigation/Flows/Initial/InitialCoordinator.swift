//
//  InitialCoordinator.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 31.08.2022.
//

import Foundation

final class InitialCoordinator: BaseCoordinator, InitialCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    fileprivate let router : Routable
    
    init(router: Routable) {
        self.router  = router
    }
}

// MARK:- Coordinatable
extension InitialCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
}

// MARK:- Private methods
private extension InitialCoordinator {
    func performFlow() {
        let vc = InitialFactory.buildInitVC() { [weak self] in
            guard let self = self else { return }
            self.finishFlow?()
        }
        router.setRootModule(vc, hideBar: true)
    }
}
