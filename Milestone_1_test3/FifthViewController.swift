//
//  FifthViewController.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    weak var myParent: AppDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myParent = (UIApplication.shared.delegate as! AppDelegate)

}

    @IBOutlet weak var inputFifthTitle: UITextField!
    @IBAction func fifthTitle(_ sender: Any) {
        let textSample: String = inputFifthTitle.text!
        self.myParent.inputTitle4.removeAll()
        self.myParent.inputTitle4.append(textSample)
        
        
    }
    
    
    
    @IBOutlet weak var inputFifthLocation: UITextField!
    
    @IBAction func fifthLocation(_ sender: Any) {
        let textSample: String = inputFifthLocation.text!
        self.myParent.appReqLocation4.removeAll()
        self.myParent.appReqLocation4.append(textSample)

        
    }
    
    @IBOutlet weak var inputFifthPeople: UITextField!
    
    
    @IBAction func fifthPeople(_ sender: Any) {
        let textSample: String = inputFifthPeople.text!
        self.myParent.appReqNum4.removeAll()
        self.myParent.appReqNum4.append(textSample)

    }
    
    @IBOutlet weak var fifthTextview: UITextView!
    
    
    
    @IBAction func saveAndQuit(_ sender: Any) {
        let textSample: String = fifthTextview.text!
        self.myParent.appaccInv.removeAll()
        self.myParent.appaccInv.append(textSample)
        //print(self.myParent.test_app_view_delegate())
        print(self.myParent.test_of_match_up_for_invitation())
        //print(self.myParent.string2Array(longPara : self.myParent.appaccInv).count)
      //  print(self.myParent.string2Array(longPara : self.myParent.appReqInvText).count)
        print(self.myParent.fromWords2ratio(words: self.myParent.string2Array(longPara : self.myParent.appaccInv), words2: self.myParent.string2Array(longPara : self.myParent.appReqInvText)))
        self.myParent.writeInTheacceptingInvitationFile()

    }
    
}
