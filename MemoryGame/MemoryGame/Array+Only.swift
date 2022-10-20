import Foundation

extension Array {
    var only: Element? {
        count == 1 ? self.first : nil
    }
}
