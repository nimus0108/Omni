//
//  SendMessageViewController.swift
//  Omni
//
//  Created by Su Min on 2/22/15.
//
//

import UIKit
import MessageUI

let messageComposer = MessageComposer()

class SendMessageViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SendMessage(sender: AnyObject) {
        if (messageComposer.canSendText()) {
            // Obtain a configured MFMessageComposeViewController
            let messageComposeVC = messageComposer.configuredMessageComposeViewController()
            
            // Present the configured MFMessageComposeViewController instance
            // Note that the dismissal of the VC will be handled by the messageComposer instance,
            // since it implements the appropriate delegate call-back
            presentViewController(messageComposeVC, animated: true, completion: nil)
        } else {
            // Let the user know if his/her device isn't able to send text messages
            let errorAlert = UIAlertView(title: "Cannot Send Text Message", message: "Your device is not able to send text messages.", delegate: self, cancelButtonTitle: "OK")
            errorAlert.show()
        }
        
        var SubjectText = "Your friend " + AppCommunication.sharedInstance.name + "is in danger. "
        var MessageBody = "Hello" + AppCommunication.sharedInstance.contact_name + ". Your friend/family member " + AppCommunication.sharedInstance.name + "is in trouble. " + AppCommunication.sharedInstance.name + "'s location is: " + AppCommunication.sharedInstance.location + ". Please call him/her and make sure that he/she is okay. If she cannot be reached, this might be an emergency. "
        var toRecipients = ["nimus0108@gmail.com"]
        
        var mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
            mc.setSubject(SubjectText)
        mc.setMessageBody(MessageBody, isHTML: false)
        mc.setToRecipients(toRecipients)
        
        self.presentViewController(mc, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
