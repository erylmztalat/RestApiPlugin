import Foundation
import Capacitor

@objc public class RestAPI: NSObject {
    private let coverFetcher: CoverFetcherService
    
    init(networkService: NetworkServiceProtocol) {
        self.coverFetcher = CoverFetcherService(networkService: networkService)
    }
    
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
    
    func getLatestCover(amount: Int, completion: @escaping (Result<AudioResponse, NetworkError>) -> Void) {
        coverFetcher.fetchCoverData(amount: amount, completion: completion)
    }
}
