//
//  AppDelegate.swift
//  FoursquareClone
//
//  Created by Ali Berkay BERBER on 15.03.2023.
//

import UIKit
import Parse
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let configuration = ParseClientConfiguration { ParseMutableClientConfiguration in
            ParseMutableClientConfiguration.applicationId = "0kNciS9wOC5YS7CItcB7xE0BjXRoInm0yt4Ife0B"
            ParseMutableClientConfiguration.clientKey = "606NE6gzHE2qfV8lMi1No9rQAIlH39l0GuDfRc3E"
            ParseMutableClientConfiguration.server = "https://parseapi.back4app.com/"
        }
        Parse.initialize(with: configuration)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

