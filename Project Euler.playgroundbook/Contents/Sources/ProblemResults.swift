//
//  ProblemResults.swift
//  JadKit
//
//  Created by Jad Osseiran on 6/10/16.
//  Copyright © 2016 Jad Osseiran. All rights reserved.
//
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice,
//  this list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
//  THE POSSIBILITY OF SUCH DAMAGE.
//

import Foundation
import Dispatch

/**
 The struct to hold the result from the problems.
 */
struct ProblemResult {
  /// The value for the problem.
  let value: Int64
  /// The problem ID associated with the solution.
  let problemID: Int
  /// The date when that solutiion was last saved. `nil` if it has not yet been inserted.
  fileprivate var lasInsertedDate: Date?

  init(value: Int64, problemID: Int) {
    self.value = value
    self.problemID = problemID
  }
}

/// The results containing the solutions for the solved problems.
private(set) var results = [Int : ProblemResult]()

/// The lock queue that we will use to make sure we safely mutate the `results` array.
private let lockQueue = dispatch_queue_create("com.jadosseiran.projecteuler.lockqueue", nil)

/**
 Saves the result into the book's cache. If an exisiting results already exisits it 
 will be overriden.
 - parameter result: The result to save.
 */
func save(result: ProblemResult) {
  dispatch_sync(lockQueue) {
    result.lasInsertedDate = Date()
    results[result.problemID] = result
  }
}

/**
 Removes the book's cached result for the given `ProblemResult`.
 - parameter result: The result to remove.
 */
func delete(result: ProblemResult) {
  dispatch_sync(lockQueue) {
    results[result.problemID] = nil
  }
}
