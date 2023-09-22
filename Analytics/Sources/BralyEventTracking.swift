//
//  BralyEventTracking.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import Foundation

public protocol BralyEventTracking {
    func logEvent(eventName: String, params: [String: Any])
    func logScreenView(screenName: String)
}
