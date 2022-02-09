//
//  Utilities.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/9/22.
//

import Foundation

class Utilities
{
    class func isNetworkAvailable() -> Bool
    {
        return (Reachability.init(hostname:BASE_URL)?.isReachable)!
    }
}
