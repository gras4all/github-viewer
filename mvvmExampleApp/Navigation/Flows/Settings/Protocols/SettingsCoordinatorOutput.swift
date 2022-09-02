//
//  SettingsCoordinatorOutput.swift
//  mvpExample
//
//  Created by Андрей Груненков on 16.08.2022.
//

import Foundation

protocol SettingsCoordinatorOutput: AnyObject {
    var finishFlow: CompletionBlock { get set }
}
