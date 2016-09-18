//
//  Passwordless.swift
//  Detroit
//
//  Created by Chris Chares on 1/21/16.
//  Copyright © 2016 io.eunoia. All rights reserved.
//

import Foundation
import KeychainAccess

public typealias UUIDResponse = (uuid: String, new: Bool) -> Void

private let STORAGE_KEY = "app_storage_key"

extension NSUUID {
    public static var persistentUUID: String {
        //First we check NSUserDefaults
        if let uuid = NSUserDefaults.standardUserDefaults().objectForKey(STORAGE_KEY) as? String {
            return uuid
        }
        
        //Now we check keychain
        let keychain = Keychain(service: NSBundle.mainBundle().bundleIdentifier!)
        if let uuid = keychain[STORAGE_KEY] {
            writeDefaults(uuid)
            return uuid
        }
        
        // If we're still here we're going to create a new UUID and pass it back
        let uuid: String = NSUUID().UUIDString
        writeDefaults(uuid)
        keychain[STORAGE_KEY] = uuid
        return uuid
    }

    private static func writeDefaults(uuid: String) {
        NSUserDefaults.standardUserDefaults().setObject(uuid, forKey: STORAGE_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}


