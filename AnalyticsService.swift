//
//  AnalyticsService.swift
//  MediatorPattern
//
//

import Foundation
import UIKit

final class AnalyticsService: AppDelegateDidFinishLaunchingListener, AppDelegateDidBecomeActiveListener, AppDelegateDidEnterBackgroundListener {
    
    func sendEvent(name: String) {
        //do stuff
    }
    
    func onDidFinishLaunching(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        sendEvent(name: "App finished launching")
    }
    
    func onDidEnterBackground() {
        sendEvent(name: "App entered background")
    }

    func onDidBecomeActive() {
        sendEvent(name: "App did become active")
    }
}
