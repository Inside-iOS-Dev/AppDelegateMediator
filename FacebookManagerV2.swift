////
////  FacebookManager.swift
////  MediatorPattern
////
////
//
//import Foundation
//import UIKit
//
//final class FacebookManager: AppDelegateDidFinishLaunchingListener, AppDelegateDidBecomeActiveListener, AppDelegateDidEnterBackgroundListener {
//    func setup() {
//        //setup fb SDK
//    }
//    
//    func activateApp() {
//        //do stuff with fb SDK
//    }
//    
//    func logEvent(_ name: String, parameters: [String: Any]) {
//        //send this event to fb SDK
//    }
//    
//    func onDidFinishLaunching(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
//        setup()
//    }
//    
//    func onDidEnterBackground() {
//        logEvent("app entered bg", parameters: [:])
//    }
//
//    func onDidBecomeActive() {
//        activateApp()
//        logEvent("app active", parameters: [:])
//    }
//}
