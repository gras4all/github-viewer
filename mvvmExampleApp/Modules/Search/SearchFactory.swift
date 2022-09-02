//
//  SearchFactory.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 01.09.2022.
//

import Foundation
import UIKit

struct SearchFactory {
    
    static func buildSearchController() -> UIViewController {
        let vc = SearchViewController()
        let vm = SearchViewModel()
        vc.viewModel = vm
        return vc
    }
    
}
