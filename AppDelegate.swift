//
//  AppDelegate.swift
//  MediatorPattern
//
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var mediator: AppDelegateMediatorInterface!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //....
        //....
        //....
        //....
        //....
        //.... more services setup
        
        let analyticsService = AnalyticsService()
        let facebookManager = FacebookManager()
        let progressHUDWrapper = ProgressHUDWrapper()
        
        let mediator = AppDelegateMediator(listeners: [analyticsService, facebookManager, progressHUDWrapper])
        self.mediator = mediator
        
        mediator.notify(event: .didFinishLaunching(application: application, launchOptions: launchOptions))
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        mediator.notify(event: .didEnterBackground)

        //....
        //....
        //....
        //....
        //....
        //.... more services activation
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        mediator.notify(event: .didBecomeActive)

        //....
        //....
        //....
        //....
        //....
        //.... more services did become active
    }
}

