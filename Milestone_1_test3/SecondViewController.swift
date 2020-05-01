//
//  SecondViewController.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    weak var myParent: AppDelegate!
    
    @IBOutlet weak var requestViewX: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //receive help from dr.Patterson about pass values in between different views.
        self.myParent = (UIApplication.shared.delegate as! AppDelegate)

}

    let textSample: String = ""
    
    
    @IBOutlet weak var reqSaveButton: UIButton!
    
    @IBOutlet weak var inputTitle: UITextView!
    
    @IBOutlet weak var testTextField: UITextField!
    @IBAction func inputTextField(_ sender: Any) {
        
        let textSample: String = testTextField.text!
        self.myParent.appReqCategory.removeAll()
        self.myParent.appReqCategory.append(textSample)
        
}
    
    @IBOutlet weak var requestnumber: UITextField!
    @IBOutlet weak var requestLocation: UITextField!
    
    
    //The function for the accept request
    @IBAction func inputrequestLocation(_ sender: Any) {
        
        let textRequest: String = requestLocation.text!
        //print(textRequest)
        self.myParent.appReqLocation.removeAll()
        self.myParent.appReqLocation.append(textRequest)
        
        
}

@IBAction func inputrequestNumber(_ sender: Any) {

let textRequestNumber: String = requestnumber.text!
//print(textRequestNumber)
    
    self.myParent.appReqNum.removeAll()
    self.myParent.appReqNum.append(textRequestNumber)
    
    
    
    }
    
    
    
    
    
    @IBAction func inputTitle1(_ sender: Any) {
        let text2: String = inputTitle.text!
        
       
    
        self.myParent.inputTitle1.removeAll()
        self.myParent.inputTitle1.append(text2)
        
        
           //other functions maybe
        print(self.myParent.test_app_view_delegate())
        self.myParent.writeInTheMakingRequestFile()
       }
    
}
