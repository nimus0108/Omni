//
//  AppCommunication.swift
//  Omni
//
//  Created by Su Min on 2/22/15.
//
//

import UIKit
private let _AppCommunicationSharedInstance = AppCommunication()

class AppCommunication: NSObject {
    class var sharedInstance:AppCommunication {
        return _AppCommunicationSharedInstance
    }
    var sharedString:String = "test"
    var location = ""
    var name = ""
    var contact_name = ""
    var contact_phone = ""


}
