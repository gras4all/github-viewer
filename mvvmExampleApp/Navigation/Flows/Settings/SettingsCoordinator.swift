//
//  SettingsCoordinator.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 01.09.2022.
//

import Foundation

final class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorOutput {
    
    lazy var finishFlow: CompletionBlock = { [weak self] in
        guard let self = self else { return }
        self.router.popToRootModule(animated: true)
    }
    
    fileprivate let router : Routable
    
    init(router: Routable) {
        self.router  = router
    }
}

// MARK:- Coordinatable
extension SettingsCoordinator: Coordinatable {
    func start() {}
}


