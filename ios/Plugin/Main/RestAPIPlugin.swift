import Foundation
import Capacitor
/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(RestAPIPlugin)
public class RestAPIPlugin: CAPPlugin {
    private let implementation = RestAPI(networkService: NetworkService())
    lazy private var titleDisplayer: TitleDisplayer? = {
        if let viewController = self.bridge?.viewController {
            return TitleDisplayerFactoryImpl().makeTitleDisplayer(presentingOn: viewController)
        }
        return nil
    }()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func getLatestCover(_ call: CAPPluginCall) {
        print("⚡️ Native getLatestCover method called")
        let amount = call.getInt("amount") ?? 0
        print("⚡️ Native getLatestCover amount:\(amount)")
        self.implementation.getLatestCover(amount: amount) { result in
            switch result {
            case .success(let response):
                print("⚡️ Success: Fetched cover data")
                if let title = response.data.first?.title {
                    DispatchQueue.main.async { [weak self] in
                        self?.titleDisplayer?.display(title: title)
                    }
                    call.resolve([
                        "covers": response.data.map { $0.cover }
                    ])
                    print("⚡️ Data resolved to JS")
                }
            case .failure(let error):
                print("⚡️ Error: \(error.localizedDescription)")
                call.reject(error.localizedDescription)
            }
        }
    }
}
