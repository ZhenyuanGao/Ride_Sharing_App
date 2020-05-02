//
//  ForthViewController.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//
import UIKit
import PassKit
class ForthViewController: UIViewController{
    
    weak var myParent: AppDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myParent = (UIApplication.shared.delegate as! AppDelegate)
        
}
//values from Text view
    @IBOutlet weak var inputforthTitle: UITextField!
    @IBAction func forthTitle(_ sender: Any) {
         let textSample: String = inputforthTitle.text!
        self.myParent.inputTitle3.removeAll()
        self.myParent.inputTitle3.append(textSample)
    }
    
    //location for the invitation
    @IBOutlet weak var inputLocationForth: UITextField!
        @IBAction func forthLocation(_ sender: Any) {
        let textSample: String = inputLocationForth.text!
        self.myParent.appInvLocation3.removeAll()
        self.myParent.appInvLocation3.append(textSample)
    }
    
    //how many people for the invitation
    @IBOutlet weak var inputForthpeople: UITextField!
    @IBAction func forthPeople(_ sender: Any) {
        let textSample: String = inputForthpeople.text!
        self.myParent.appInvNum3.removeAll()
        self.myParent.appInvNum3.append(textSample)
    }
    //the save button
    @IBOutlet weak var forthTextview: UITextView!
    @IBAction func saveTextview(_ sender: Any) {
        let textSample: String = forthTextview.text!
        self.myParent.appReqInvText.removeAll()
        self.myParent.appReqInvText.append(textSample)
        print(self.myParent.test_app_view_delegate())
        self.myParent.writeInTheMakingInvitationFile()
        
    }
   

    
}
