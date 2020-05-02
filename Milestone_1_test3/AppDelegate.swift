//
//  AppDelegate.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // three variables for making a request
    var inputTitle1:String=""
    var appReqLocation:String=""
    var appReqNum:String=""
    var appReqCategory:String=""//text view variable
    
    // three variables for accepting a request
    var inputTitle2:String=""
    var appReqLocation2:String=""
    var appReqNum2:String=""
    var accReqText:String=""//text view variable
    
    // three variables for making a invitation
    var inputTitle3:String=""
    var appInvLocation3:String=""
    var appInvNum3:String=""
    var appReqInvText:String=""//text view variable

    
    // three variables for accepting a invitation
    var inputTitle4:String=""
    var appReqLocation4:String=""
    var appReqNum4:String=""
    var appaccInv:String=""
    var testString:String=""//text view variable
    //CREATE A FILE TO HANDLE ALL THE DATA
    let file = "/Users/kevingao/Desktop/kevin's work/Milestone_1_test3/Milestone_1_test3/Request.txt"
  let file_invitation = "/Users/kevingao/Desktop/kevin's work/Milestone_1_test3/Milestone_1_test3/Invitation.txt"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //function to push a notification
        registerForPushNotifications()
        
        //important part to send a notifications
        //let center = UNUserNotificationCenter.current()
          //  .requestAuthorization(options: [.alert, .sound, .badge]) {(granted, error) in}
        // Override point for customization after application launch.
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
//designed to combine all of the strings together
    func test_app_view_delegate() -> String {
       
        return(appReqLocation4+appReqNum4+inputTitle4+appaccInv)
        //(appInvLocation3+appInvNum3+inputTitle3+appReqInvText)//(appReqLocation+appReqNum+inputTitle1+appReqCategory)//(appReqLocation2+appReqNum2+inputTitle2+accReqText)(appReqLocation+appReqNum+inputTitle1)
    }
    //My passage matching algorithm for request,which checks for whether the location, the title and the amount of people are the same and check if the similar words are more than 50 percents of the whole text in the text view.
    func test_of_match_up() -> Bool {
        if(appReqLocation==appReqLocation2  && inputTitle2==appReqCategory&&appReqNum2==appReqNum&&fromWords2ratio(words: string2Array(longPara : accReqText), words2: string2Array(longPara : inputTitle1))>0.5){
        return true
        }
        else{
            print("something is wrong")
        return false
        }//(appReqLocation2+appReqNum2+inputTitle2+accReqText)//(appReqLocation+appReqNum+inputTitle1)
    }
    //My passage matching algorithm for invitation,which checks for whether the location, the title and the amount of people are the same and check if the similar words are more than 50 percents of the whole text in the text view.
    func test_of_match_up_for_invitation() -> Bool {
        if(appReqLocation4==appInvLocation3  && appReqNum4==appInvNum3&&inputTitle3==inputTitle4&&fromWords2ratio(words: string2Array(longPara : appaccInv), words2: string2Array(longPara : appReqInvText))>0.35){
  
        return true
        }
        else{
            print("something is wrong")
        return false
        }//(appReqLocation2+appReqNum2+inputTitle2+accReqText)//(appReqLocation+appReqNum+inputTitle1)
    }
    //Match up for check if two textview worlds have similar words
    func test_of_match_up_for_textview() -> Bool {
     if(appReqLocation4==appInvLocation3  && appReqNum4==appInvNum3&&inputTitle3==inputTitle4
        ){
         print ("Those two should match up")
     return true
     }
     else{
         print("something is wrong,those two can not match up")
     return false
     }

}
    //The function changes the string in to an array
    func string2Array(longPara : String) -> [String] {
        //let s = "Hello everyone. This is a sentence."
        var arr = [String]()
    
        longPara.enumerateSubstrings(in:longPara.startIndex..<longPara.endIndex, options: .byWords) {
            substr , r, r2, stop in
            arr.append(substr!)
        }
        
        return arr
    }
    //Get the precentage of the same words in the a paragraph
    func fromWords2ratio(words : [String], words2 : [String]) -> Double {
        var counter:Int = 0
        let sizeOfWords:Double = Double(words.count)
        let sizeOfWords2:Double = Double(words2.count)
        var setOfWords:Set = [""]
        for i in 0..<(words.count-1) {
            for t in 0..<(words2.count-1){
                if (words[i]==words2[t]) {
                    setOfWords.insert(words[i])
        
            }
    }
        }
        counter=setOfWords.count
        return 2*Double(counter)/(sizeOfWords+sizeOfWords2)
    }
    // function for pushing a notification
    func registerForPushNotifications() {
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge]) {(granted, error) in
                    print("Permission granted: \(granted)")
            }
    }
    
    //The four functions below are designed for put the data entered in the text view in the Request.txt file. Each view controller have one of this function
    func writeInTheMakingRequestFile(){
        
    let text = appReqLocation+" "+appReqNum+" "+appReqCategory+" "+inputTitle1//just a combine all infomation together
 

        //let fileURL = dir.appendingPathComponent(file)
        
        do {
            let data = try NSString(contentsOfFile: file,
            encoding: String.Encoding.ascii.rawValue)
            let combined = data as String+text
            try combined.write(toFile: file,
                       atomically: true,
                       encoding: String.Encoding.ascii)

        }
        catch{/* error handling here */}
        // If a value was returned, print it.
            // read here
       
        
    }
    func writeInTheacceptingRequestFile(){
         
     let text = inputTitle2+" "+appReqLocation2+" "+appReqNum2+" "+accReqText
      //just a combine all infomation together
     

         
         
         do {
             let data = try NSString(contentsOfFile: file,
             encoding: String.Encoding.ascii.rawValue)
             let combined = data as String+text
             try combined.write(toFile: file,
                        atomically: true,
                        encoding: String.Encoding.ascii)

         }
         catch{/* error handling here */}
         // If a value was returned, print it.
             // read here
       
     }
         
    func writeInTheacceptingInvitationFile(){
            
        let text = inputTitle4+" "+appReqLocation4+" "+appReqNum4+" "+appaccInv
           
         //just a combine all infomation together
            
            do {
                let data = try NSString(contentsOfFile: file_invitation,
                encoding: String.Encoding.ascii.rawValue)
                let combined = data as String+text
                try combined.write(toFile: file_invitation,
                           atomically: true,
                           encoding: String.Encoding.ascii)

            }
            catch{/* error handling here */}
            // If a value was returned, print it.
                // read here
          
        }
            
    func writeInTheMakingInvitationFile(){
            
        let text = inputTitle3+" "+appInvLocation3+" "+appInvNum3+" "+appReqInvText
         //just a combine all infomation together
     
            do {
                let data = try NSString(contentsOfFile: file_invitation,
                encoding: String.Encoding.ascii.rawValue)
                let combined = data as String+text
                try combined.write(toFile: file_invitation,
                           atomically: true,
                           encoding: String.Encoding.ascii)

            }
            catch{/* error handling here */}
           
        }
            
  
}
