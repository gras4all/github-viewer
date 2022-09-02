//
//  MainCoordinator.swift
//  mvpExample
//
//  Created by Андрей Груненков on 16.08.2022.
//

import Foundation
import UIKit

final class MainCoordinator: BaseCoordinator, MainCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    fileprivate let router : Routable
    fileprivate let factory : CoordinatorFactoryProtocol
    
    init(router: Routable, factory: CoordinatorFactoryProtocol) {
        self.router  = router
        self.factory = factory
    }
}

// MARK:- Coordinatable
extension MainCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
}

// MARK:- Private methods
private extension MainCoordinator {
    
    func performFlow() {
        guard let tc = makeTabsController() else {
            finishFlow?()
            return
        }
        router.setRootModule(tc, hideBar: true)
    }
    
    func makeTabsController() -> UITabBarController? {
        let searchController = SearchFactory.buildSearchController()
        let searchCoordinator = factory.makeSearchCoordinator(router: router)
        addDependency(searchCoordinator)
    
        let settingsController = SettingsFactory.buiildSettingsVC()
        let settingsCoordinator = factory.makeSettingsCoordinator(router: router)
        addDependency(settingsCoordinator)
        
        return TabsControllerViewFactory.buildTabsController(controllers: [
            (title: "Search", controller: searchController),
            (title: "Settings", controller: settingsController)
        ])
    }
    
}

