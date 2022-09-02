//
//  InitialFactory.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 31.08.2022.
//

import Foundation
import UIKit

struct InitialFactory {
    
    static func buildInitVC(completion: @escaping CompletionBlock) -> UIViewController {
        let vc = InitialViewController()
        vc.goNext = completion
        let vm = InitialViewModel()
        vc.initialViewModel = vm
        return vc
    }
    
}
