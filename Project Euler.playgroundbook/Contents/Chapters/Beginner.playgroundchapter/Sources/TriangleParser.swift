//
//  TriangleParser.swift
//  Project-Euler
//
//  Created by Jad Osseiran on 16/10/16.
//  Copyright © 2016 Jad Osseiran. All rights reserved.
//

import Foundation

public func parseTriangleTextFile(named fileName: String) -> [[UInt8]] {
  var contents = parseTextFile(named: fileName)
  // Remvoe trailing new line
  contents.remove(at: contents.index(before: contents.endIndex))

  var triangle = [[UInt8]]()
  for line in contents.components(separatedBy: "\n") {
    triangle.append(line.components(separatedBy: " ").map({ UInt8($0)! }))
  }
  return triangle
}
