//
//  Parser.swift
//  Project-Euler
//
//  Created by Jad Osseiran on 15/10/16.
//  Copyright © 2016 Jad Osseiran. All rights reserved.
//

import Foundation

/// Attempts to parse a txt file with the given name. Will return either the
/// contents of the text file or an error message.
///
/// - parameter fileName: The name of the file to parse.
/// - returns: The contents of the file or an error message.
public func parseTextFile(named fileName: String) -> String {
	// Attempt to pull the text from the file if it exists.
	do {
		let fileURL = try getURL(fileName: fileName)
		return try String(contentsOf: fileURL, encoding: .utf8)
	} catch {
		return error.localizedDescription
	}
	return "Error: no results"
}

/// Attempts to create a URL for a txt file with the given name. Throws an error
/// if the file is not found.
///
/// - parameter fileName: The name of the file for which to create the URL.
/// - returns: The URL of the file.
/// - throws: An error if the file is not found.
private func getURL(fileName: String) throws -> URL {
	if let url = Bundle.main.url(forResource: fileName, withExtension: "txt") {
		return url
	}
	let exception = NSError(domain: "Error: File does not exist", code: 0, userInfo: nil)
	throw exception
}
