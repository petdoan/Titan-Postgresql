//
//  Database.swift
//  TitanKit
//
//  Created by Nghia Tran on 11/15/16.
//  Copyright © 2016 Titan. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TitanKit

class DatabaseSpec: QuickSpec {
    
    override func spec() {
        
        describe("Connection to Database") {
            
            context("Valid localhost database", {
                
                it("", closure: { 
                    
                    // Valid
                    let validParam = ConnectionParam.validConnectionParam
                    
                    let result = Database.share.connectDatabase(withParam: validParam)
                    expect(result.connection).toNot(beNil())
                    expect(result.status) == ConnectionStatus.CONNECTION_OK
                    
                })
                
                it("Invalid", closure: {
                    
                    // invalid
                    let invalidParam = ConnectionParam.validConnectionParam
                    
                    let result = Database.share.connectDatabase(withParam: invalidParam)
                    expect(result.connection).to(beNil())
                    expect(result.status) != ConnectionStatus.CONNECTION_OK
                    
                })
            })
        }
    }
}