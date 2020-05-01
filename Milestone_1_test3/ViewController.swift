//
//  ViewController.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       /*
        let file = "/Users/kevingao/Desktop/kevin's work/Milestone_1_test3/Milestone_1_test3/Request.txt"
        let text = "some text" //just a text

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(file)
            do {
            var data = try NSString(contentsOfFile: file,
                encoding: String.Encoding.ascii.rawValue)
                print(data)

            }
            catch{/* error handling here */}
            // If a value was returned, print it.

            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
                //try text.write(toFile: file,
                //atomically: true,
                //encoding: String.Encoding.ascii)
            }
            catch {/* error handling here */}

            //reading
            do {
                let text2 = try String(contentsOfFile: file, encoding: .utf8)
                print(text2)
                print(1)
            }
            catch {/* error handling here */}
        }
        */
        
    }
    
    @IBOutlet weak var reserReqB: UIButton!
    
    @IBAction func reserveRequest(_ sender: Any) {
        
        //jump to the reserve view
        self.performSegue(withIdentifier: "SecondViewSegue", sender: self)
               //other functions maybe
           }
        
    
    @IBOutlet weak var acceptReqB: UIButton!
    
    @IBAction func acceptRequest(_ sender: Any) {
        self.performSegue(withIdentifier: "ThirdViewSegue", sender: self)
        //other functions maybe
        
    }
    

    @IBOutlet weak var reserInvB: UIButton!
    @IBAction func reserveInvitation(_ sender: Any) {
    self.performSegue(withIdentifier: "ForthViewSegue", sender: self)
    
    
    
    
    }

    @IBOutlet weak var acceptInvB: UIButton!
    
    @IBAction func acceptInvitation(_ sender: Any) {
    
    
    self.performSegue(withIdentifier: "FifthViewSegue", sender: self)
    
    
    }
    



}

