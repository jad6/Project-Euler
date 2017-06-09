/*:
 # Coded triangle numbers
 [Problem 42](https://projecteuler.net/problem=42) - Difficulty level: 5%

 The nth term of the sequence of triangle numbers is given by,
 
 ![42](42-1.png)

 so the first ten triangle numbers are:

 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

 By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t(10). If the word value is a triangle number then we shall call the word a triangle word.

 Using `words.txt`, a 16K text file containing nearly two-thousand common English words, how many are triangle words?
 
 *NOTE: The contents of `words.txt` are stored in: `var words: [String] { get }`*
 */
//#-hidden-code
var words: [String] = {
	var contents = parseTextFile(named: "42-2")
	contents = contents.replacingOccurrences(of: "\"", with: "")
	return contents.components(separatedBy: ",")
}()
//#-end-hidden-code
