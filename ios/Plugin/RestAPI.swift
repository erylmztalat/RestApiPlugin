import Foundation

@objc public class RestAPI: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
