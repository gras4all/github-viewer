//
//  SearchCoordinatorOutput.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 01.09.2022.
//

import Foundation

protocol SearchCoordinatorOutput: AnyObject {
    var finishFlow: CompletionBlock? { get set }
}
