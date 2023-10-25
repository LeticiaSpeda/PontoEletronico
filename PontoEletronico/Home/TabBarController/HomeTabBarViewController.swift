import UIKit

final class HomeTabBarViewController: UITabBarController {

    private let homeController = HomeViewController()
    private let receiptController = ReceiptViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }

    private func configureTabBar() {
        homeController.tabBarItem.title = "Home"
        homeController.tabBarItem.image = UIImage(systemName: "house")

        receiptController.tabBarItem.title = "Recibos"
        receiptController.tabBarItem.image = UIImage(
            systemName:"doc.text"
        )
        self.setViewControllers([homeController, receiptController], animated: true)

        selectedViewController = homeController

        tabBar.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.2352941176, blue: 0.5450980392, alpha: 1)
        tabBar.tintColor = .white
    }
}
