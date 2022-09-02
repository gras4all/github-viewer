//
//  AppCoordinator.swift
//  mvpExample
//
//  Created by Андрей Груненков on 15.08.2022.
//

import Foundation

fileprivate enum LaunchInstructor {
    case initial
    case main
    case search
    case settings
        
    static func setup() -> LaunchInstructor {
        let githubIDKey = UserDefaults.standard.string(forKey: UserDefaultsKeys.githubIDKey)
        if githubIDKey == nil {
            return .initial
        } else {
            return .main
        }
    }
}

final class AppCoordinator: BaseCoordinator {
    
    fileprivate let factory: CoordinatorFactoryProtocol
    fileprivate let router : Routable
    
    fileprivate var instructor: LaunchInstructor {
        return LaunchInstructor.setup()
    }
    
    init(router: Routable, factory: CoordinatorFactoryProtocol) {
        self.router  = router
        self.factory = factory
    }
}

// MARK:- Coordinatable
extension AppCoordinator: Coordinatable {
    func start() {
        switch instructor {
        case .main:
            performMainFlow()
        case .initial:
            performInitialFlow()
        default:
            performInitialFlow()
        }
    }
}

// MARK:- Private methods
private extension AppCoordinator {
    
    func performMainFlow() {
        let coordinator = factory.makeMainCoordinator(router: router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.start()
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func performInitialFlow() {
        let coordinator = factory.makeInitialCoordinator(router: router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.start()
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
}

