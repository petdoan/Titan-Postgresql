//
//  SSLObj.swift
//  Titan
//
//  Created by Nghia Tran on 10/14/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Cocoa
import ObjectMapper

class SSLObj: BaseModel {

    
    //
    // MARK: - Variable
    var clientKeyFile: String!
    var clientCertificate: String!
    var serverRootCertificate: String!
    var certificateRevocationList: String!
    var sslCompression: Bool!
    
    
    //
    // MARK: - Override
    required init?(_ map: Map) {
        super.init(map: map)
    }
    
    required init?(map: Map) {
        fatalError("init(map:) has not been implemented")
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.clientKeyFile <- map[Constants.Obj.SSL.ClientKeyFile]
        self.clientCertificate <- map[Constants.Obj.SSL.ClientCertificate]
        self.serverRootCertificate <- map[Constants.Obj.SSL.ServerRootCertificate]
        self.certificateRevocationList <- map[Constants.Obj.SSL.CertificateRevocationList]
        self.sslCompression <- map[Constants.Obj.SSL.SSLCompression]
    }
    
}