//
//  InitialFactory.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 31.08.2022.
//

import Foundation
import UIKit

struct InitialFactory {
    
    static func buiildInitVC(completion: @escaping CompletionBlock) -> UIViewController {
        let vc = InitialViewController()
        vc.goNext = completion
        let vm = InitialViewModel()
        vc.initialViewModel = vm
        return vc
    }
    
}
