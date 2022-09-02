//
//  TabsViewController.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 01.09.2022.
//

import Foundation
import UIKit

final class TabsViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupControllers(controllers: [TabContent]) {
        
        self.viewControllers = controllers.map { tab in
            let tabBarItem = UITabBarItem(title: tab.title, image: nil, selectedImage: nil)
            tab.controller.tabBarItem = tabBarItem
            return tab.controller
        }
        
    }
}

//MARK: - private methods
private extension TabsViewController {
    
    func setupViews() {
        view.backgroundColor = .black
        tabBar.backgroundColor = .systemGray6
        tabBar.isTranslucent = false
        
        if #available(iOS 15.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = .systemGray6
            let tabBarItemAppearance = UITabBarItemAppearance()

            tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
            tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

            tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance

            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance
        } else {
            tabBar.tintColor = .gray
            tabBar.unselectedItemTintColor = .white
        }
    }
    
}

