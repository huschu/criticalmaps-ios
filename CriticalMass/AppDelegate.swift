//
//  AppDelegate.swift
//  CriticalMaps
//
//  Created by Leonard Thomas on 3/4/19.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    lazy var appController = AppController()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
            guard ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil else {
                // We are in a XCTest and setting up the AppController would add Noise to the tests
                return true
            }
        #endif

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = appController.rootViewController
        window?.makeKeyAndVisible()

//        Appirater.appLaunched(true)
        appController.onAppLaunch()
        return true
    }

    func applicationWillEnterForeground(_: UIApplication) {
        appController.onWillEnterForeground()
    }
}
