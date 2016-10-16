/*:
 # Summation of primes
 [Problem 18](https://projecteuler.net/problem=18) - Diifculty level: 5%

 By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

 ![](18-1.png)

 That is, 3 + 7 + 4 + 9 = 23.

 Find the maximum total from top to bottom of the triangle below:
 
 ![](18-2.png)

 *NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, [Problem 67](https://projecteuler.net/problem=67), is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)*
 
 *NOTE II: The contents of the triangle are stored in: `var triangle: [UInt8] { get }`*
 */
//#-hidden-code
var _triangle: [[UInt8]]?
var triangle: [[UInt8]] {
  if _triangle == nil {
    _triangle = parseTriangleTextFile(named: "18-3")
  }
  return _triangle!
}
//#-end-hidden-code
//#-code-completion(identifier, hide, _triangle)
