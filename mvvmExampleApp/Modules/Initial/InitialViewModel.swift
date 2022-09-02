//
//  InitialViewModel.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 31.08.2022.
//

import RxSwift
import RxCocoa

final class InitialViewModel {
    
    let name = BehaviorRelay(value: "")
    
    let isHiddenNextButton = BehaviorSubject<Bool>(value: true)
    
    let disposeBag = DisposeBag()
    
    init() {
        name.subscribe { [weak self] (event) in
            if let githubId = event.element,
               !githubId.isEmpty {
                UserDefaults.standard.set(githubId, forKey: UserDefaultsKeys.githubIDKey)
            }
            let isHidden = event.element?.isEmpty ?? true
            self?.isHiddenNextButton.on(.next(isHidden))
        }.disposed(by: disposeBag)
    }
    
}
