//
//  BundleExtension.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import Foundation


// MARK: - Load Bundle resources
public extension Bundle {

    func loadData(fileName: String, fileExtension: String = "json") -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("Error: \(error)")
            }
        }
        return nil
    }

    func decode<T: Codable>(fileName: String) -> T? {
        if let data = Bundle.main.loadData(fileName: fileName) {
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("[LOG] ❌ Error: \(error)")
            }
        }
        return nil
    }

    func decodePList<T: Codable>(fileName: String) -> T? {
        if let data = Bundle.main.loadData(fileName: fileName, fileExtension: "plist") {
            do {
                let decoder = PropertyListDecoder()
                let plistData = try decoder.decode(T.self, from: data)
                return plistData
            } catch {
                print("[LOG] ❌ Error: \(error)")
            }
        }
        return nil
    }
}

// MARK: - Version
public extension Bundle {

    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
