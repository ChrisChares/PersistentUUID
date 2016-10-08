//
//  Passwordless.swift
//  Detroit
//
//  Created by Chris Chares on 1/21/16.
//  Copyright © 2016 io.eunoia. All rights reserved.
//

import Foundation
import KeychainAccess

public typealias UUIDResponse = (_ uuid: String, _ new: Bool) -> Void

private let STORAGE_KEY = "app_storage_key"

extension UUID {
    public static var persistentUUID: String {
        //First we check NSUserDefaults
        if let uuid = UserDefaults.standard.object(forKey: STORAGE_KEY) as? String {
            return uuid
        }
        
        //Now we check keychain
        //let keychain = Keychain(service)
        let bundleID = Bundle.main.bundleIdentifier!
        let keychain = Keychain(service: bundleID)
        if let uuid = keychain[STORAGE_KEY] {
            writeDefaults(uuid)
            return uuid
        }
        
        // If we're still here we're going to create a new UUID and pass it back
        let uuid: String = UUID().uuidString
        writeDefaults(uuid)
        keychain[STORAGE_KEY] = uuid
        return uuid
    }

    fileprivate static func writeDefaults(_ uuid: String) {
        UserDefaults.standard.set(uuid, forKey: STORAGE_KEY)
        UserDefaults.standard.synchronize()
    }
}


