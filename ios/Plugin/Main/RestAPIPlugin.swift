import Foundation
import Capacitor
/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(RestAPIPlugin)
public class RestAPIPlugin: CAPPlugin {
    private let implementation = RestAPI(networkService: NetworkService())

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func getLatestCover(_ call: CAPPluginCall) {
        DispatchQueue.main.async { [weak self] in
            let amount = call.getInt("amount") ?? 0
            self?.implementation.getLatestCover(amount: amount) { result in
                switch result {
                case .success(let response):
                    if let title = response.data.first?.title {
                        self?.showTitle(title)
                        call.resolve([
                            "covers": response.data.map { $0.cover }
                        ])
                    }
                case .failure(let error):
                    call.reject(error.localizedDescription)
                }
            }
        }
    }
    
    func showTitle(_ title: String) {
        guard let viewController = self.bridge?.viewController else { return }
        
        let alert = UIAlertController(title: "Cover Title", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
