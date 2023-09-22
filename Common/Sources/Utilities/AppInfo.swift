

import UIKit

private enum Constants {
	static let appStoreURLFormat = "https://apps.apple.com/app/id%@"
    static let appStoreRateURLFormat = "https://apps.apple.com/us/app/id%@?action=write-review"
    static let appStoreSubscriptionURL = "https://apps.apple.com/account/subscriptions"
    static let appStoreBralyURL = "https://apps.apple.com/us/developer/braly/id1637078418"
    static let urlPrivacy = "https://bralyvn.com/privacy-policy.php"
    static let urlTermsOfUse = "https://bralyvn.com/term-and-condition.php"
}

public class AppInfo {
	// MARK: - Constants
	public static let osName = UIDevice.current.systemName
	public static let osVersion = UIDevice.current.systemVersion
	
	// MARK: - Variables
	public class var appIconBadgeNumber: Int {
		get { return UIApplication.shared.applicationIconBadgeNumber }
		set(value) { UIApplication.shared.applicationIconBadgeNumber = value }
	}
	
	// MARK: - Functions
	public class func getAppVersionString(_ string: String) -> String {
		guard let info = Bundle.main.infoDictionary else {
			return ""
		}
		guard let version = info["CFBundleShortVersionString"] as? String else {
			return ""
		}
		guard let build = info["CFBundleVersion"] as? String else {
			return ""
		}
		
		let appVersion = String(format: string, arguments: [version, build, "", ""])
		return appVersion
	}

    public class func getAppStoreStringURL(_ appStoreId: String) -> String {
        return String(format: Constants.appStoreURLFormat, appStoreId)
    }
	
	public class func getAppStoreURL(_ appStoreId: String) -> URL? {
		return URL(string: getAppStoreStringURL(appStoreId))
	}

    public class func openPrivacyPolicy(urlString: String?) {
        guard let url = URL(string: urlString == nil ? Constants.urlPrivacy : urlString!) else { return }
        UIApplication.shared.open(url)
    }

    public class func openTermsOfUse(urlString: String?) {
        guard let url = URL(string: urlString == nil ? Constants.urlTermsOfUse : urlString!) else { return }
        UIApplication.shared.open(url)
    }

    public class func openRateApp(appStoreId: String) {
        guard let url = getAppStoreURL(appStoreId) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }

    public class func openSubscriptionPage() {
        guard let url = URL(string: Constants.appStoreSubscriptionURL) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }

    public class func openMoreApps() {
        guard let url = URL(string: Constants.appStoreBralyURL) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }

}
