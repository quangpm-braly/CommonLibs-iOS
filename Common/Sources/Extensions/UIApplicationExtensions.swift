

import UIKit

private enum Constants {
	static let statusBarTag = 1234
}

public extension UIApplication {

	func setStatusBarBackgroundColor(_ color: UIColor) {
        let keyWindow = windows.filter { $0.isKeyWindow }.first

        if let statusBar = keyWindow?.viewWithTag(Constants.statusBarTag) {
            statusBar.backgroundColor = color
        } else {
            let statusBar = UIView(frame: keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor = color
            statusBar.tag = Constants.statusBarTag
            keyWindow?.addSubview(statusBar)
        }
	}

    var topViewController: UIViewController? {
        var pointedViewController = windows.filter {$0.isKeyWindow}.first?.rootViewController

        while  pointedViewController?.presentedViewController != nil {
            switch pointedViewController?.presentedViewController {
            case let navagationController as UINavigationController:
                pointedViewController = navagationController.viewControllers.last
            case let tabBarController as UITabBarController:
                pointedViewController = tabBarController.selectedViewController
            default:
                pointedViewController = pointedViewController?.presentedViewController
            }
        }
        return pointedViewController
    }

    var topNavController: UINavigationController? {
        return topViewController as? UINavigationController
    }
}
