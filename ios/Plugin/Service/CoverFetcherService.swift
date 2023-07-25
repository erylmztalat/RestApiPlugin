//
//  CoverService.swift
//  Plugin
//
//  Created by talate on 24.07.2023.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import Foundation

protocol CoverFetcher {
    func fetchCoverData(amount: Int, completion: @escaping (Result<AudioResponse, NetworkError>) -> Void)
}

class CoverFetcherService: CoverFetcher {
    
    let networkService: NetworkServiceProtocol
    var cache: AudioResponse?

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCoverData(amount: Int, completion: @escaping (Result<AudioResponse, NetworkError>) -> Void) {
        if let cache = cache {
            completion(.success(cache))
        } else {
            let request = CoverRequest(endpoint: .getLatestCover)
            let _ = networkService.perform(request)
                .sink(receiveCompletion: { result in
                    switch result {
                    case .failure(let error):
                        completion(.failure(error))
                    case .finished:
                        break
                    }
                }, receiveValue: { [weak self] response in
                    self?.cache = response
                    completion(.success(response))
                })
        }
    }
}
