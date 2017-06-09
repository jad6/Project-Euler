/*:
 # Path sum: two ways
 [Problem 81](https://projecteuler.net/problem=81) - Difficulty level: 10%

 In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by only moving to the right and down, is indicated in bold red and is equal to 2427.

 ![](81-1.png)

 Find the minimal path sum, in matrix.txt, a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by only moving right and down.

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
