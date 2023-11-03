import UIKit

final class HomeViewController: UIViewController, ViewCode {
    
    // MARK: - Attributes
    private var timer: Timer?
    private var timerFormatter = FormatTimeDate()
    private lazy var camera = Camera()
    private lazy var imageController = UIImagePickerController()

    //MARK: - Components
    private lazy var keepTimeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 260/2
        view.layer.borderWidth = 5
        view.layer.borderColor = #colorLiteral(red: 0.2505765258, green: 0.235574224, blue: 0.5368923611, alpha: 0.9389486755)
        view.backgroundColor = .white
        view.contentMode = .scaleToFill
        view.enableViewCode()
        return view
    }()

    private lazy var presentsTimeTableLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 62, weight: .bold)
        label.enableViewCode()
        return label
    }()

    private lazy var registerPoint: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.2518715971, green: 0.2408739304, blue: 0.554685179, alpha: 1)
        button.setTitle("Registrar Ponto", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.layer.cornerRadius = 10
        button.enableViewCode()
        return button
    }()

    // MARK: - lifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        setupTime()
        setupActions()
    }


    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

    // MARK: - Helpers
    @objc
    func updateTime() {
        let timeNow = timerFormatter.getTime(Date())
        presentsTimeTableLabel.text = timeNow
    }

    @objc func tappedRegisterPointButton() {
        tryOpenCamera()
    }

    private func tryOpenCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            camera.openCamera(self, imageController)
        }
    }

    private func setupActions() {
        registerPoint.addTarget(self, action: #selector(tappedRegisterPointButton), for: .touchUpInside)
    }

    func setupTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    func setupHierarchy() {
        view.addSubview(keepTimeView)
        view.addSubview(registerPoint)
        keepTimeView.addSubview(presentsTimeTableLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            keepTimeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keepTimeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            keepTimeView.heightAnchor.constraint(equalToConstant: 260),
            keepTimeView.widthAnchor.constraint(equalToConstant: 260),

            presentsTimeTableLabel.centerXAnchor.constraint(equalTo: keepTimeView.centerXAnchor),
            presentsTimeTableLabel.centerYAnchor.constraint(equalTo: keepTimeView.centerYAnchor),

            registerPoint.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 14
            ),
            registerPoint.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -14
            ),
            registerPoint.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -14
            ),
            registerPoint.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupStyle() {
        view.backgroundColor = #colorLiteral(red: 0.3402957023, green: 0.3199218112, blue: 0.7291272096, alpha: 0.9389486755)
    }
}
