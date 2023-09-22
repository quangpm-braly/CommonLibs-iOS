//
//  NetworkConnection.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import Network

public protocol NetworkConnectionObserver: AnyObject {
    func statusDidChange(status: NWPath.Status)
}

public class NetworkConnection {

    struct NetworkChangeObservation {
        weak var observer: NetworkConnectionObserver?
    }

    private var monitor = NWPathMonitor()
    private static let _sharedInstance = NetworkConnection()
    private var observations = [ObjectIdentifier: NetworkChangeObservation]()

    var currentStatus: NWPath.Status {
        return monitor.currentPath.status
    }

    public class func sharedInstance() -> NetworkConnection {
        return _sharedInstance
    }

    init() {
        monitor.pathUpdateHandler = { [unowned self] path in
            for (id, observations) in self.observations {

                // If any observer is nil, remove it from the list of observers
                guard let observer = observations.observer else {
                    self.observations.removeValue(forKey: id)
                    continue
                }

                DispatchQueue.main.async(execute: {
                    observer.statusDidChange(status: path.status)
                })
            }
        }
        monitor.start(queue: DispatchQueue.global(qos: .background))
    }

    public func addObserver(observer: NetworkConnectionObserver) {
        let id = ObjectIdentifier(observer)
        observations[id] = NetworkChangeObservation(observer: observer)
    }

    public func removeObserver(observer: NetworkConnectionObserver) {
        let id = ObjectIdentifier(observer)
        observations.removeValue(forKey: id)
    }

}

