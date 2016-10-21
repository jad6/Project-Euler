/*:
 # Passcode derivation
 [Problem 79](https://projecteuler.net/problem=79) - Diifculty level: 5%

 A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.

 The text file, `keylog.txt`, contains fifty successful login attempts.

 Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.
 
 *NOTE: The contents of `keylog.txt` are stored in: `var attempts: [String] { get }`*
 */
//#-hidden-code
var _attempts: [String]?
var attempts: [String] {
  if _attempts == nil {
    var contents = parseTextFile(named: "79-1")
    // Remove the last character; it is a new line
    contents.remove(at: contents.index(before: contents.endIndex))
    // Cache the array.
    _attempts = contents.components(separatedBy: "\n")
  }
  return _attempts!
}
//#-end-hidden-code
//#-code-completion(identifier, hide, _attempts)
