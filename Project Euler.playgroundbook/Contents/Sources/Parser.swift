//
//  Parser.swift
//  Project-Euler
//
//  Created by Jad Osseiran on 15/10/16.
//  Copyright © 2016 Jad Osseiran. All rights reserved.
//

import Foundation

public func parseTextFile(named fileName: String) -> String {
  // Pull the contents form the file. Not much we can do with error handling in Swift Playground Books.
  let fileURL = Bundle.main.url(forResource: fileName, withExtension: "txt")
  return try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
}
