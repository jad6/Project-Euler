/*:
 # Path sum: three ways
 [Problem 82](https://projecteuler.net/problem=82) - Difficulty level: 20%

 NOTE: This problem is a more challenging version of Problem 81.

 The minimal path sum in the 5 by 5 matrix below, by starting in any cell in the left column and finishing in any cell in the right column, and only moving up, down, and right, is indicated in red and bold; the sum is equal to 994.

 ![](82-1.png)

 Find the minimal path sum, in matrix.txt, a 31K text file containing a 80 by 80 matrix, from the left column to the right column.

 *NOTE: The matrix is available in `var matrix: [[Int]]`. When the Playground is run the matrix text file is parsed into this variable, which will take around 10-20 seconds.*
*/
//#-hidden-code
var matrix: [[Int]] = {
	let matrixText: String = parseTextFile(named: "matrix")
	var matrix: [[Int]] = []
	for line in matrixText.components(separatedBy: .newlines) {
		let components = line.components(separatedBy: ",")
		if components.count > 1 {
			matrix.append(components.map { Int($0)! })
		}
	}
	return matrix
}()
//#-end-hidden-code
