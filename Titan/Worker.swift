//
//  Worker.swift
//  Titan
//
//  Created by Nghia Tran on 11/17/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Cocoa
import ReSwift


typealias WorkerCompletionBlock = (Result<Any>) -> ()


//
// MARK: - Worker
protocol Worker {
    
    var action: Action! {get set}
    
    init()
}


//
// MARK: - Async Worker
protocol AsyncWorker: Worker {
    func execute(_ completionBlock: WorkerCompletionBlock?)
}


//
// MARK: - Sync Worker
protocol SyncWorker: Worker {
    func execute()
}


//
// MARK: - Extension Worker with Init method.
extension Worker {
    
    init(action: Action) {
        self.init()
        self.action = action
    }
}
