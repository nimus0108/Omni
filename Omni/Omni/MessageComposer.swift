//
//  MessageComposer.swift
//  Omni
//
//  Created by Su Min on 2/22/15.
//
//

import Foundation
import MessageUI

let textMessageRecipients = [AppCommunication.sharedInstance.contact_phone] // for pre-populating the recipients list (optional, depending on your needs)

class MessageComposer: NSObject, MFMessageComposeViewControllerDelegate {
    
    // A wrapper function to indicate whether or not a text message can be sent from the user's device
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    // Configures and returns a MFMessageComposeViewController instance
    func configuredMessageComposeViewController() -> MFMessageComposeViewController {
        let messageComposeVC = MFMessageComposeViewController()
        messageComposeVC.messageComposeDelegate = self  //  Make sure to set this property to self, so that the controller can be dismissed!
        messageComposeVC.recipients = textMessageRecipients
        
        messageComposeVC.body = "Hello" + AppCommunication.sharedInstance.contact_name + ". Your friend/family member " + AppCommunication.sharedInstance.name + "is in trouble. " + AppCommunication.sharedInstance.name + "'s location is: " + AppCommunication.sharedInstance.location + ". Please call him/her and make sure that he/she is okay. If she cannot be reached, this might be an emergency. "
        return messageComposeVC
    }
    
    // MFMessageComposeViewControllerDelegate callback - dismisses the view controller when the user is finished with it
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}