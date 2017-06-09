/*:
 # Path sum: four ways
 [Problem 83](https://projecteuler.net/problem=83) - Difficulty level: 25%

 NOTE: This problem is a significantly more challenging version of Problem 81.

 In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by moving left, right, up, and down, is indicated in bold red and is equal to 2297.

 ![](83-1.png)

 Find the minimal path sum, in matrix.txt, a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by moving left, right, up, and down.

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
