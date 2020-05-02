//
//  SecondViewController.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//

import UIKit
import PassKit
class SecondViewController: UIViewController {

    weak var myParent: AppDelegate!
    
    @IBOutlet weak var requestViewX: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //receive help from dr.Patterson about pass values in between different views.
        self.myParent = (UIApplication.shared.delegate as! AppDelegate)

}

    let textSample: String = ""
    
    
   
    //the textview
    @IBOutlet weak var inputTitle: UITextView!
    //the input box for title
    @IBOutlet weak var testTextField: UITextField!
    
    //put data into variable in appDelegate
    @IBAction func inputTextField(_ sender: Any) {
        
        let textSample: String = testTextField.text!
        self.myParent.appReqCategory.removeAll()
        self.myParent.appReqCategory.append(textSample)
        
}
    //how many people go with
    @IBOutlet weak var requestnumber: UITextField!
    //where the location is
    @IBOutlet weak var requestLocation: UITextField!
    
    
    //The function for the accept request
    @IBAction func inputrequestLocation(_ sender: Any) {
        
        let textRequest: String = requestLocation.text!
        //print(textRequest)
        self.myParent.appReqLocation.removeAll()
        self.myParent.appReqLocation.append(textRequest)
        
        
    }
//put the number in the variable in appDelegate
@IBAction func inputrequestNumber(_ sender: Any) {

let textRequestNumber: String = requestnumber.text!
//print(textRequestNumber)
    
    self.myParent.appReqNum.removeAll()
    self.myParent.appReqNum.append(textRequestNumber)
}

    //put the variable in the variable in appDelegate
    @IBAction func inputTitle1(_ sender: Any) {
        let text2: String = inputTitle.text!
        self.myParent.inputTitle1.removeAll()
        self.myParent.inputTitle1.append(text2)
        print(self.myParent.test_app_view_delegate())
        self.myParent.writeInTheMakingRequestFile()
       }
    
}
