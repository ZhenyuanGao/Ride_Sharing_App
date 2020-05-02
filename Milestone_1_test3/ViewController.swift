//
//  ViewController.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 2/8/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//Follow the steps of the tutorials online https://medium.com/@abdul.i.aljebouri/bare-minimum-apple-pay-xcode-9-swift-4-5245bd3dcde4

import UIKit
import PassKit
class ViewController: UIViewController,PKPaymentAuthorizationViewControllerDelegate {

    var myText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //make the button show up
       addApplePayPaymentButtonToView()
        
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
        view.addConstraint(NSLayoutConstraint(item: paymentButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 200))
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
    
    //make a request button
    @IBOutlet weak var reserReqB: UIButton!
    
    @IBAction func reserveRequest(_ sender: Any) {
        
        //jump to the reserve view
        self.performSegue(withIdentifier: "SecondViewSegue", sender: self)
               //other functions maybe
           }
        
//accept a request button
    @IBOutlet weak var acceptReqB: UIButton!
    
    @IBAction func acceptRequest(_ sender: Any) {
        self.performSegue(withIdentifier: "ThirdViewSegue", sender: self)
        //other functions maybe
        
    }
    
//make an invitation button
    @IBOutlet weak var reserInvB: UIButton!
    @IBAction func reserveInvitation(_ sender: Any) {
    self.performSegue(withIdentifier: "ForthViewSegue", sender: self)
    
    }
//accept an invitation button
    @IBOutlet weak var acceptInvB: UIButton!
    
    @IBAction func acceptInvitation(_ sender: Any) {
    
    
    self.performSegue(withIdentifier: "FifthViewSegue", sender: self)
    
    
    }
    
}

