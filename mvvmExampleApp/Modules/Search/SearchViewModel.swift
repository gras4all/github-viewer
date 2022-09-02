//
//  SearchViewModel.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 01.09.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    
    let searchText = BehaviorRelay(value: "")
    
    lazy var data: Driver<[Repository]> = {
        
        return self.searchText.asObservable()
            .throttle(DispatchTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest(NetworkService.repositoriesBy)
            .asDriver(onErrorJustReturn: [])
    }()
    
}
