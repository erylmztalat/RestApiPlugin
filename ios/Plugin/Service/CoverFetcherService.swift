//
//  CoverService.swift
//  Plugin
//
//  Created by talate on 24.07.2023.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import Foundation
import Combine

protocol CoverFetcher {
    func fetchCoverData(amount: Int, completion: @escaping (Result<AudioResponse, NetworkError>) -> Void)
}

class CoverFetcherService: CoverFetcher {
    
    let networkService: NetworkServiceProtocol
    var cache: AudioResponse?
    private var cancellables: Set<AnyCancellable> = []

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCoverData(amount: Int, completion: @escaping (Result<AudioResponse, NetworkError>) -> Void) {
        print("⚡️ It is fetching cover data...")
        if let cache = cache {
            print("⚡️ It resulted with cache.")
            completion(.success(cache))
        } else {
            print("⚡️ It is requesting to:\(Endpoint.getLatestCover.url)")
            let request = CoverRequest(endpoint: .getLatestCover)
            let _ = networkService.perform(request)
                .sink(receiveCompletion: { result in
                    print("⚡️ This is the result from network service: \(result)")
                    switch result {
                    case .failure(let error):
                        completion(.failure(error))
                    case .finished:
                        break
                    }
                }, receiveValue: { [weak self] response in
                    print("⚡️ This is the response from network service: \(response)")
                    self?.cache = response
                    completion(.success(response))
                })
                .store(in: &cancellables)
        }
    }
}
