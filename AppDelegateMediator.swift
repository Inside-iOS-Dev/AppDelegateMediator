//
//  AppDelegateMediator.swift
//  MediatorPattern
//

import Foundation
import UIKit

protocol AppDelegateListener {}

protocol AppDelegateDidFinishLaunchingListener: AppDelegateListener {
    func onDidFinishLaunching(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
}

protocol AppDelegateDidEnterBackgroundListener: AppDelegateListener {
    func onDidEnterBackground()
}

protocol AppDelegateDidBecomeActiveListener: AppDelegateListener {
    func onDidBecomeActive()
}

enum AppDelegateEvent {
    case didFinishLaunching(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
    case didEnterBackground
    case didBecomeActive
}

protocol AppDelegateMediatorInterface {
    func notify(event: AppDelegateEvent)
}

final class AppDelegateMediator: AppDelegateMediatorInterface {
    private let listeners: [AppDelegateListener]
    
    private lazy var uniqueListeners: [AppDelegateListener] = {
        var filteredListeners = [AppDelegateListener]()
        for listener in listeners {
            let isInTheListAlready: Bool = filteredListeners.contains(where: { (uniqueListener: AppDelegateListener) -> Bool in
                let type1 = type(of: uniqueListener)
                let type2 = type(of: listener)
                return type1 == type2
            })
            
            if !isInTheListAlready {
                filteredListeners.append(listener)
            }
        }
        return filteredListeners
    }()
    
    init(listeners: [AppDelegateListener]) {
        self.listeners = listeners
    }
    
    func notify(event: AppDelegateEvent) {
        switch event {
        case .didFinishLaunching(let application, let launchOptions):
            let filteredListeners = uniqueListeners.compactMap { $0 as? AppDelegateDidFinishLaunchingListener }
            filteredListeners.forEach { $0.onDidFinishLaunching(application: application, launchOptions: launchOptions) }
            
        case .didEnterBackground:
            let filteredListeners = uniqueListeners.compactMap { $0 as? AppDelegateDidEnterBackgroundListener}
            filteredListeners.forEach { $0.onDidEnterBackground() }

        case .didBecomeActive:
            let filteredListeners = uniqueListeners.compactMap { $0 as? AppDelegateDidBecomeActiveListener }
            filteredListeners.forEach { $0.onDidBecomeActive() }

        }
    }
}
