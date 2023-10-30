import UIKit

final class ReceiptTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: ReceiptViewController.self)

    private lazy var registerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4440024197, green: 0.4346665144, blue: 0.7222117782, alpha: 1)
        view.enableViewCode()
        return view
    }()

    private lazy var registerStatusLabel: UILabel = {
        let label = UILabel()
        label.text = " STATUS: SINCRONIZADA "
        label.textColor = .white
        label.backgroundColor = #colorLiteral(red: 0.3190990388, green: 0.3008719683, blue: 0.6852146387, alpha: 0.8015831954).withAlphaComponent(0.5)
        label.font = .boldSystemFont(ofSize: 18)
        label.enableViewCode()
        return label
    }()

    private lazy var descriptionStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Registro de ponto do trabalhador"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.enableViewCode()
        return label
    }()

    private lazy var registrationDataLabel: UILabel = {
        let label = UILabel()
        label.text = "30/10/2023 11:08 - ALURA PONTO"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        label.enableViewCode()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func configureHierarchy() {
        contentView.addSubview(registerView)

        registerView.addSubview(registerStatusLabel)
        registerView.addSubview(descriptionStatusLabel)
        registerView.addSubview(registrationDataLabel)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([

            registerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            registerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            registerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            registerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            registerStatusLabel.topAnchor.constraint(
                equalTo: registerView.topAnchor,
                constant: 10
            ),
            registerStatusLabel.leadingAnchor.constraint(
                equalTo: registerView.leadingAnchor,
                constant: 10
            ),

            descriptionStatusLabel.topAnchor.constraint(
                equalTo: registerStatusLabel.bottomAnchor,
                constant: 10
            ),
            descriptionStatusLabel.leadingAnchor.constraint(
                equalTo: registerView.leadingAnchor,
                constant: 10),


            registrationDataLabel.topAnchor.constraint(
                equalTo: descriptionStatusLabel.bottomAnchor,
                constant: 10),

            registrationDataLabel.leadingAnchor.constraint(
                equalTo: registerView.leadingAnchor,
                constant: 10
            ),

            registerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    func configureStyle() {
        backgroundColor = #colorLiteral(red: 0.3190990388, green: 0.3008719683, blue: 0.6852146387, alpha: 1)
        selectionStyle = .none
    }

}
