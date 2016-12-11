/*:
 # Maximum path sum II
 [Problem 67](https://projecteuler.net/problem=67) - Difficulty level: 5%

 By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

 ![](67-1.png)

 That is, 3 + 7 + 4 + 9 = 23.

 Find the maximum total from top to bottom in `triangle.txt` (parsed in the Swift Playground), a 15K text file containing a triangle with one-hundred rows.

 *NOTE: This is a much more difficult version of [Problem 18](https://projecteuler.net/problem=18). It is not possible to try every route to solve this problem, as there are 2^99 altogether! If you could check one trillion (101^2) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)*
 
 *NOTE II: The contents of the `triangle.txt` are stored in: `var triangle: [UInt8] { get }`*
 */
//#-hidden-code
var _triangle: [[UInt8]]?
var triangle: [[UInt8]] {
  if _triangle == nil {
    _triangle = parseTriangleTextFile(named: "67-2")
  }
  return _triangle!
}
//#-end-hidden-code
//#-code-completion(identifier, hide, _triangle)

