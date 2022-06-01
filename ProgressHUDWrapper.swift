//
//  ProgressHUDWrapper.swift
//  MediatorPattern
//

import Foundation
import UIKit

final class ProgressHUDWrapper: AppDelegateDidFinishLaunchingListener {
    func setup() {
        ProgressHUD.setup()
    }
    
    func show() {
        ProgressHUD.show()
    }
    
    func dismiss() {
        ProgressHUD.dismiss()
    }
    
    func onDidFinishLaunching(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        setup()
    }
}
