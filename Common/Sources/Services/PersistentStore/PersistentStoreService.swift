import Foundation

public protocol IPersistentStoreService {
	func set<T>(suiteName: String, value: T, key: String)
	func get(suiteName: String, key: String) -> Any?
	func setObject<T: Codable>(suiteName: String, value: T?, key: String)
	func object<T: Codable>(suiteName: String, key: String) -> T?
	func remove(suiteName: String, key: String)
}

public struct PersistentStoreService: IPersistentStoreService {
	public init() { }
	
	public func set<T>(suiteName: String = "", value: T, key: String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        defaults?.set(value, forKey: key)
        defaults?.synchronize()
	}
	
	public func get(suiteName: String = "", key: String) -> Any? {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        return defaults?.value(forKey: key)
	}
	
	public func setObject<T: Codable>(suiteName: String = "", value: T?, key: String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
		let data = try? JSONEncoder().encode(value)
        defaults?.set(data, forKey: key)
        defaults?.synchronize()
	}
	
	public func object<T: Codable>(suiteName: String = "", key: String) -> T? {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
		guard let data = defaults?.value(forKey: key) as? Data else { return nil }
		let object = try? JSONDecoder().decode(T.self, from: data)
		return object
	}
	
	public func remove(suiteName: String = "", key: String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        if defaults?.object(forKey: key) != nil {
            defaults?.removeObject(forKey: key)
            defaults?.synchronize()
        }
	}
}
