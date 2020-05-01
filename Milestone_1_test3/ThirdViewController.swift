//
//  ThirdViewController.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    weak var myParent: AppDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myParent = (UIApplication.shared.delegate as! AppDelegate)
}

    @IBOutlet weak var accreqtitle: UITextField!
    @IBAction func accReqTitle(_ sender: Any) {
        let textSample: String = accreqtitle.text!
    self.myParent.inputTitle2.removeAll()
    self.myParent.inputTitle2.append(textSample)
    }
    
    @IBOutlet weak var inputreqlocation: UITextField!
    
    @IBAction func Reqlocation(_ sender: Any) {
        let textSample: String = inputreqlocation.text!
        self.myParent.appReqLocation2.removeAll()
        self.myParent.appReqLocation2.append(textSample)
    }
    
    @IBOutlet weak var NumberPeople: UITextField!
    @IBAction func countPeople(_ sender: Any) {
        let textSample: String = NumberPeople.text!
        self.myParent.appReqNum2.removeAll()
        self.myParent.appReqNum2.append(textSample)
    }
    
    
    
    @IBOutlet weak var otherDetails: UITextView!
    
    @IBAction func saveAndPost(_ sender: Any) {
        let text2: String = otherDetails.text!
            
           
        
            self.myParent.accReqText.removeAll()
            self.myParent.accReqText.append(text2)
            
            
               //other functions maybe
            //print(self.myParent.test_app_view_delegate())
           //here we might need to call a function
            print(self.myParent.test_of_match_up())
            //print(self.myParent.string2Array(longPara : self.myParent.accReqText).count)
            //print(self.myParent.string2Array(longPara : self.myParent.inputTitle1).count)
            print(self.myParent.fromWords2ratio(words: self.myParent.string2Array(longPara : self.myParent.accReqText), words2: self.myParent.string2Array(longPara : self.myParent.inputTitle1)))
        
            self.myParent.writeInTheacceptingRequestFile()
    }
    
}
