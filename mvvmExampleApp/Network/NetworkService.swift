//
//  NetworkService.swift
//  mvvmExampleApp
//
//  Created by Андрей Груненков on 01.09.2022.
//

import RxSwift
import RxCocoa

struct NetworkService {
    
    static func repositoriesBy(_ query: String) -> Observable<[Repository]> {
        guard let githubID = UserDefaults.standard.string(forKey: UserDefaultsKeys.githubIDKey),
              !githubID.isEmpty,
              let url = URL(string: "https://api.github.com/search/repositories?q=\(query)+user:\(githubID)") else {
                return Observable.just([])
        }
        
        return URLSession.shared.rx.json(url: url)
            .retry(3)
            .map(parse)
    }
    
    static func parse(json: Any) -> [Repository] {
        guard let dict = json as? NSDictionary,
            let items = dict["items"] as? [[String: Any]]  else {
            return []
        }
        var repositories = [Repository]()
        
        items.forEach{
            guard let repoName = $0["name"] as? String,
                let repoURL = $0["html_url"] as? String else {
                    return
            }
            repositories.append(Repository(repoName: repoName, repoURL: repoURL))
        }
        return repositories
    }
    
}



