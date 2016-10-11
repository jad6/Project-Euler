/*:
 # Coded triangle numbers
 [Problem 42](https://projecteuler.net/problem=42) - Diifculty level: 5%

 The nth term of the sequence of triangle numbers is given by, 
 
 ![42](42-1.png)

 so the first ten triangle numbers are:

 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

 By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t(10). If the word value is a triangle number then we shall call the word a triangle word.

 Using `words.txt` (parsed in the Swift Playground), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
 
 *NOTE: The contents of `words.txt` are stored in: `var words: [String] { get }`*
 */
//#-hidden-code
import Foundation

var _words: [String]?
var words: [String] {
  if _words == nil {
    // Pull the contents form the file. Not much we can do with error handling in Swift Playground Books.
    let fileURL = Bundle.main.url(forResource: "42-2", withExtension: "txt")
    var contents = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
    // Remove the first and last characters; they are the extra '"' chars.
    contents.remove(at: contents.startIndex)
    contents.remove(at: contents.index(before: contents.endIndex))
    // Cache the array.
    _words = contents.components(separatedBy: "\",\"")
  }
  return _words!
}
//#-end-hidden-code
//#-code-completion(identifier, hide, _words)
