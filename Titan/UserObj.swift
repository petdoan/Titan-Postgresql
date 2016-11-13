//
//  UserModel.swift
//  Titan
//
//  Created by Nghia Tran on 10/12/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

final class UserObj: BaseModel {
    
    //
    // MARK: - Variable
    var username = "guest"
    var isGuest: Bool = true
    
    
    //
    // MARK: - Current User
    private struct Static {
        static var instance: UserObj!
    }
    
    
    /// Share instance
    class var currentUser : UserObj {
        
        // LOCK
        objc_sync_enter(self)
        defer {objc_sync_exit(self)}
        
        // Executing
        if Static.instance == nil {
            let guestUser = UserObj.guestUser()
            Static.instance = guestUser
        }
        
        return Static.instance
    }
}

//
// MARK: - Private
extension UserObj {
    
    /// Init GUEST User
    fileprivate class func guestUser() -> UserObj {
        let guestUser = UserObj()
        guestUser.isGuest = true
        return guestUser
    }
}


/// Base Class protocol
extension UserObj: BaseObjectModel {}


//
// MARK: - Active recoder
extension UserObj: ActiveRecord {
    typealias Realm = UserRealmObj
    typealias Request = FetchListConnectionsRequest
}

//
// MARK: - Realm Model Convertible
extension UserObj: BaseRealmModelConvertible {
    
    /// Kind of ream obj
    typealias E = UserRealmObj
    
    
    /// Convert
    func toRealmObject() -> E {
        let realmUser = UserRealmObj()
        
        realmUser.isGuest = self.isGuest
        realmUser.username = self.username
        
        return realmUser
    }
}
