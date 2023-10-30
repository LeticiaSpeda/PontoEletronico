import UIKit

final class ReceiptViewController: UIViewController, ViewCode {

    private lazy var photoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 160 / 2
        view.clipsToBounds = true
        view.enableViewCode()
        return view
    }()

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.camera)
        imageView.contentMode = .scaleAspectFill
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var receiptLabel: UILabel = {
        let label = UILabel()
        label.text = "Recibos"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)
        label.enableViewCode()
        return label
    }()

    private lazy var receiptTableView = {
        let table = UITableView()
        table.backgroundColor = #colorLiteral(red: 0.3190990388, green: 0.3008719683, blue: 0.6852146387, alpha: 1)
        table.register(ReceiptTableViewCell.self, forCellReuseIdentifier: ReceiptTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.enableViewCode()
        return table
    }()

    override func viewDidLoad() {
        commonInit()
    }

    func configureHierarchy() {
        view.addSubview(photoView)
        view.addSubview(receiptLabel)
        view.addSubview(receiptTableView)

        photoView.addSubview(photoImageView)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
             photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoView.heightAnchor.constraint(equalToConstant: 160),
            photoView.widthAnchor.constraint(equalToConstant: 160),

            photoImageView.centerXAnchor.constraint(equalTo: photoView.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: photoView.centerYAnchor),

            receiptLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 22),
            receiptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),

            receiptTableView.topAnchor.constraint(equalTo: receiptLabel.bottomAnchor, constant: 22),
            receiptTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            receiptTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            receiptTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }

    func configureStyle() {
        view.backgroundColor = #colorLiteral(red: 0.3402957023, green: 0.3199218112, blue: 0.7291272096, alpha: 0.9389486755)
    }


}

extension ReceiptViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ReceiptTableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }


}
