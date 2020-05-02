//
//  ThirdViewController.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//

import UIKit
import PassKit
class ThirdViewController: UIViewController,PKPaymentAuthorizationViewControllerDelegate {

    weak var myParent: AppDelegate!    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myParent = (UIApplication.shared.delegate as! AppDelegate)
        //call the function to make the ApplePay button shows up
        addApplePayPaymentButtonToView()
}
//title for the accepting request
    @IBOutlet weak var accreqtitle: UITextField!
    @IBAction func accReqTitle(_ sender: Any) {
        let textSample: String = accreqtitle.text!
    self.myParent.inputTitle2.removeAll()
    self.myParent.inputTitle2.append(textSample)
    }
    //where is the location
    @IBOutlet weak var inputreqlocation: UITextField!
    
    @IBAction func Reqlocation(_ sender: Any) {
        let textSample: String = inputreqlocation.text!
        self.myParent.appReqLocation2.removeAll()
        self.myParent.appReqLocation2.append(textSample)
    }
    //how many people are going
    @IBOutlet weak var NumberPeople: UITextField!
    @IBAction func countPeople(_ sender: Any) {
        let textSample: String = NumberPeople.text!
        self.myParent.appReqNum2.removeAll()
        self.myParent.appReqNum2.append(textSample)
    }
    
    
    
    @IBOutlet weak var otherDetails: UITextView!
    //Compare the values of requesting and accepting to check whether they are equal
    @IBAction func saveAndPost(_ sender: Any) {
        let text2: String = otherDetails.text!
            self.myParent.accReqText.removeAll()
            self.myParent.accReqText.append(text2)
            print(self.myParent.test_of_match_up())
            print(self.myParent.fromWords2ratio(words: self.myParent.string2Array(longPara : self.myParent.accReqText), words2: self.myParent.string2Array(longPara : self.myParent.inputTitle1)))
        
            self.myParent.writeInTheacceptingRequestFile()
    }
        // This function is designed by abdul.i.aljebouri, modified by Kevin Gao
        //Creating the apple pay button
        private func addApplePayPaymentButtonToView() {
            let paymentButton = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .black)
            //create costraint for the button
            paymentButton.translatesAutoresizingMaskIntoConstraints = false
            //the button is triggered by the action touchUpInside
            paymentButton.addTarget(self, action: #selector(applePayButtonTapped(sender:)), for: .touchUpInside)
            view.addSubview(paymentButton)
            //create my own constaint for the button. It is positioned at coordinate (100, 200)
            view.addConstraint(NSLayoutConstraint(item: paymentButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 100))
            view.addConstraint(NSLayoutConstraint(item: paymentButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 370))
        }
    //actually display the Apple Pay dialogue. the actions triggered by the button Designed by abdul.i.aljebouri, modified by Kevin Gao.
        @objc private func applePayButtonTapped(sender: UIButton) {
            // Cards that should be accepted
            let paymentNetworks:[PKPaymentNetwork] = [.amex,.masterCard,.visa]

            if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: paymentNetworks) {
                //make an Apply Pay request
                let request = PKPaymentRequest()
                request.merchantIdentifier = "merchant.com.2400"//my own personal fake merchant
                request.countryCode = "US"
                request.currencyCode = "USD"
                request.supportedNetworks = paymentNetworks
                //request.requiredShippingContactFields = [.name, .postalAddress]
                request.requiredBillingContactFields = [.name, .postalAddress]
                 //This is based on using Stripe
                request.merchantCapabilities = .capability3DS
                
                //different tabs for the Apple Pay menu
                let gas = PKPaymentSummaryItem(label: "Gas Money", amount: NSDecimalNumber(decimal:100.00), type: .final)
                let service = PKPaymentSummaryItem(label: "Service fees", amount: NSDecimalNumber(decimal: 10.00), type: .final)
                let tips = PKPaymentSummaryItem(label: "Tips", amount: NSDecimalNumber(decimal:1.00), type: .final)
                let tax = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(decimal:20.00), type: .final)
                let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(decimal:131.00), type: .final)
                request.paymentSummaryItems = [gas, tips, tax,service, total]
                //offers the authorizations for the applePay
                let authorizationViewController = PKPaymentAuthorizationViewController(paymentRequest: request)

                if let viewController = authorizationViewController {
                    viewController.delegate = self

                    present(viewController, animated: true, completion: nil)
                }
            }
        }
    // the two functions below are designed by abdul.i.aljebouri, modified by Kevin Gao
        func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
          // Let the Operating System know that the payment was accepted successfully
          completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
        }

        func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
           // Dismiss the Apple Pay UI
           dismiss(animated: true, completion: nil)
        }

}
