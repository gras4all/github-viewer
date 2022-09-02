//
//  SettingsFactory.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 02.09.2022.
//

import Foundation
import UIKit

struct SettingsFactory {
    
    static func buiildSettingsVC() -> UIViewController {
        let vc = SettingsViewController()
        let vm = SettingsViewModel()
        vc.settingsViewModel = vm
        return vc
    }
    
}
