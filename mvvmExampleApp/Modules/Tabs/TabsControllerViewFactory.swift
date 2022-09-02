//
//  TabsControllerViewFactory.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 01.09.2022.
//

import Foundation
import UIKit

struct TabsControllerViewFactory {
    
    static func buildTabsController(controllers: [TabContent]) -> UITabBarController {
        let tvc = TabsViewController()
        tvc.setupControllers(controllers: controllers)
        return tvc
    }
    
}
