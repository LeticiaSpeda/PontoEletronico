import UIKit

protocol ViewCode {
    func commonInit()
    func configureHierarchy()
    func configureConstraints()
    func configureStyle()
}

extension ViewCode {
    func commonInit() {
        configureStyle()
        configureHierarchy()
        configureConstraints()
    }

    func configureStyle() {

    }
}

extension UIView {
    func enableViewCode() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
