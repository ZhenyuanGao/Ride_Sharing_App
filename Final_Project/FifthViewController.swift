//
//  FifthViewController.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//

import UIKit
import PassKit
class FifthViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate{
    weak var myParent: AppDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myParent = (UIApplication.shared.delegate as! AppDelegate)
        //call the function to make the ApplePay button shows up
        addApplePayPaymentButtonToView()
}
//record the text view material
    @IBOutlet weak var inputFifthTitle: UITextField!
    @IBAction func fifthTitle(_ sender: Any) {
        let textSample: String = inputFifthTitle.text!
        self.myParent.inputTitle4.removeAll()
        self.myParent.inputTitle4.append(textSample)
    }
    //get the location for the invitation
    @IBOutlet weak var inputFifthLocation: UITextField!
    @IBAction func fifthLocation(_ sender: Any) {
        let textSample: String = inputFifthLocation.text!
        self.myParent.appReqLocation4.removeAll()
        self.myParent.appReqLocation4.append(textSample)
    }
    //how many people for the invitation
    @IBOutlet weak var inputFifthPeople: UITextField!
    @IBAction func fifthPeople(_ sender: Any) {
        let textSample: String = inputFifthPeople.text!
        self.myParent.appReqNum4.removeAll()
        self.myParent.appReqNum4.append(textSample)
    }
    //variable for the text view
    @IBOutlet weak var fifthTextview: UITextView!
    //save button for accepting an invitation
    @IBAction func saveAndQuit(_ sender: Any) {
        let textSample: String = fifthTextview.text!
        self.myParent.appaccInv.removeAll()
        self.myParent.appaccInv.append(textSample)
        print(self.myParent.test_of_match_up_for_invitation())
        print(self.myParent.fromWords2ratio(words: self.myParent.string2Array(longPara : self.myParent.appaccInv), words2: self.myParent.string2Array(longPara : self.myParent.appReqInvText)))
        self.myParent.writeInTheacceptingInvitationFile()

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
            view.addConstraint(NSLayoutConstraint(item: paymentButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 5))
            view.addConstraint(NSLayoutConstraint(item: paymentButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 280))
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
