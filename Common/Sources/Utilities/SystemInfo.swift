

import UIKit

public class SystemInfo {

	public static let screenBounds 		= UIScreen.main.bounds
	public static let screenWidth 			= UIScreen.main.bounds.width
	public static let screenHeight 		= UIScreen.main.bounds.height
	public static let screenNativeBounds 	= UIScreen.main.nativeBounds
	public static let screenNativeWidth	= UIScreen.main.nativeBounds.width
	public static let screenNativeHeight 	= UIScreen.main.nativeBounds.height

	public static var statusBarHeight: CGFloat {
		guard let window = UIApplication.shared.windows.first else { return 0 }
		return window.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
	}

	public static var safeAreaInsetTop: CGFloat {
		guard let window = UIApplication.shared.windows.first else { return 0 }
		return window.safeAreaInsets.top
	}

	public static var safeAreaInsetBottom: CGFloat {
		guard let window = UIApplication.shared.windows.first else { return 0 }
		return window.safeAreaInsets.bottom
	}
}
