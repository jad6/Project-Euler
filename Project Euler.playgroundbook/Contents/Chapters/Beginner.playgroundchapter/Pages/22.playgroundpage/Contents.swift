/*:
 # Names scores
 [Problem 22](https://projecteuler.net/problem=22) - Diifculty level: 5%

 Using `names.txt` (parsed in the Swift Playground), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

 For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

 What is the total of all the name scores in the file?

 *NOTE: The contents of `names.txt` are stored in: `var names: [String] { get }`*
 */
//#-hidden-code
var _names: [String]?
var names: [String] {
  if _names == nil {
    var contents = parseTextFile(named: "22-1")
    // Remove the first and last characters; they are the extra '"' chars.
    contents.remove(at: contents.startIndex)
    contents.remove(at: contents.index(before: contents.endIndex))
    // Cache the array.
    _names = contents.components(separatedBy: "\",\"")
  }
  return _names!
}
//#-end-hidden-code
//#-code-completion(identifier, hide, _names)
