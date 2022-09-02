//
//  CoordinatorFactoryProtocol.swift
//  mvpExample
//
//  Created by Андрей Груненков on 16.08.2022.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    
    func makeMainCoordinator(router: Routable) -> Coordinatable & MainCoordinatorOutput
    
    func makeInitialCoordinator(router: Routable) -> Coordinatable & InitialCoordinatorOutput
    
    func makeSearchCoordinator(router: Routable) -> Coordinatable & SearchCoordinatorOutput
    
    func makeSettingsCoordinator(router: Routable) -> Coordinatable & SettingsCoordinatorOutput
    
}

