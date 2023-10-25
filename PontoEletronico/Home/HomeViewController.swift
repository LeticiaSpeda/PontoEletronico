import UIKit

final class HomeViewController: UIViewController, ViewCode {

    private var timer: Timer?

    private lazy var keepTimeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 200/2
        view.layer.borderWidth = 3
        view.layer.borderColor = #colorLiteral(red: 0.2505765258, green: 0.235574224, blue: 0.5368923611, alpha: 0.9389486755)
        view.backgroundColor = .white
        view.enableViewCode()
        return view
    }()

    private lazy var presentsTimeTableLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 52, weight: .bold)
        label.enableViewCode()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        configureTime()
    }

    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

    @objc
    func updateTime() {
        let timeNow = FormatTimeDate().getTime(Date())
        presentsTimeTableLabel.text = timeNow
    }

    func configureTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    func configureHierarchy() {
        view.addSubview(keepTimeView)
        keepTimeView.addSubview(presentsTimeTableLabel)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            keepTimeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keepTimeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            keepTimeView.heightAnchor.constraint(equalToConstant: 200),
            keepTimeView.widthAnchor.constraint(equalToConstant: 200),

            presentsTimeTableLabel.centerXAnchor.constraint(equalTo: keepTimeView.centerXAnchor),
            presentsTimeTableLabel.centerYAnchor.constraint(equalTo: keepTimeView.centerYAnchor),
        ])
    }

    func configureStyle() {
        view.backgroundColor = #colorLiteral(red: 0.3402957023, green: 0.3199218112, blue: 0.7291272096, alpha: 0.9389486755)
    }

}

