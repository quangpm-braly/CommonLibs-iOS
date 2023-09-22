//
//  FirebaseEventTracking.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import FirebaseAnalytics


struct FirebaseEventTracking: BralyEventTracking {

    func logEvent(eventName: String, params: [String : Any]) {
        Analytics.logEvent(eventName, parameters: params)
    }

    func logScreenView(screenName: String) {
        Analytics.logEvent(screenName, parameters: nil)
    }

}
