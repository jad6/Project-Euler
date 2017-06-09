/*:
 # Roman numerals
 [Problem 89](https://projecteuler.net/problem=89) - Difficulty level: 20%

 For a number written in Roman numerals to be considered valid there are basic rules which must be followed. Even though the rules allow some numbers to be expressed in more than one way there is always a "best" way of writing a particular number.

 For example, it would appear that there are at least six ways of writing the number sixteen:

     IIIIIIIIIIIIIIII
     VIIIIIIIIIII
     VVIIIIII
     XIIIIII
     VVVI
     XVI

 However, according to the rules only XIIIIII and XVI are valid, and the last example is considered to be the most efficient, as it uses the least number of numerals.

 The 11K text file, roman.txt, contains one thousand numbers written in valid, but not necessarily minimal, Roman numerals; see [About... Roman Numerals](https://projecteuler.net/about=roman_numerals) for the definitive rules for this problem.

 Find the number of characters saved by writing each of these in their minimal form.

 Note: You can assume that all the Roman numerals in the file contain no more than four consecutive identical units.

 *NOTE: The numbers are available in `var numerals: [String]`. When the Playground is run the matrix text file is parsed into this variable, which will take around 1-5 seconds.*
*/
//#-hidden-code
var numerals: [String] = {
	let contents = parseTextFile(named: "roman")
	return contents.components(separatedBy: .newlines)
}()
//#-end-hidden-code
