//
//  SettingsViewModel.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 02.09.2022.
//

import RxSwift
import RxCocoa

struct SettingsViewModel {
    
    let name: BehaviorRelay<String>
    let disposeBag = DisposeBag()
    
    init() {
        let githubId = UserDefaults.standard.string(forKey: UserDefaultsKeys.githubIDKey) ?? ""
        name = BehaviorRelay(value: githubId)
        name.subscribe { (event) in
            if let githubId = event.element,
               !githubId.isEmpty {
                UserDefaults.standard.set(githubId, forKey: UserDefaultsKeys.githubIDKey)
            }
        }.disposed(by: disposeBag)
    }
    
}

