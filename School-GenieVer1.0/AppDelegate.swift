//
//  AppDelegate.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 24/10/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseInstanceID
import FirebaseMessaging
@available(iOS 10.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
 
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //createSlidingMenu()
        if #available(iOS 8.0, *){
            let settings:UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        }
        else{
        let types:UIRemoteNotificationType = [.alert, .badge, .sound]
        application.registerForRemoteNotifications(matching: types)
        }
        FIRApp.configure()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.tokenrefreshNotification(notification:)), name: NSNotification.Name.firInstanceIDTokenRefresh, object: nil)
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
    
        // Print full message.
        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
   
    func changeRootViewControllerToSWRevealViewController () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController")
        if let window = self.window{
            window.rootViewController = controller
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        FIRMessaging.messaging().disconnect()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        connectToFCM()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "SchoolGenie")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func tokenrefreshNotification(notification: NSNotification){
        let refreshedToken = FIRInstanceID.instanceID().token()!
        print("InstanceIdToken: \(refreshedToken)")
        
        connectToFCM()
    }
    
    
    func connectToFCM(){
        
        FIRMessaging.messaging().connect{ (error) in
            if(error != nil){
                print("Unable to connect\(error)")
            }
            else{
                print("Connected to FCM")
            }
            
        }
    }
    
    func createSlidingMenu(){
        
        var rootViewController = self.window!.rootViewController
        var mainstorybord = rootViewController?.storyboard
        
        
        let isloggedin:Bool = UserDefaults.standard.value(forKey: "IsLogin") as! Bool
        
        let frontViewController2 = mainstorybord?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC//create instance of frontVC
        
         let frontViewController1  = mainstorybord?.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC//create instance of rearVC(menuVC)
        
        let frontViewController  = mainstorybord?.instantiateViewController(withIdentifier: "DashboardVC") as! UINavigationController//create instance of rearVC(menuVC)
        
        let rearViewController  = mainstorybord?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC//create instance of rearVC(menuVC)
        
        
        //create instance of swRevealVC based on front and rear VC
        var swRevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController);
        if(isloggedin){
        swRevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController1);
        }
        swRevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut;
        swRevealVC?.toggleAnimationDuration = 0.30;
        
        //set swRevealVC as rootVC of windows
        self.window?.rootViewController = swRevealVC!;
        
    }


}

