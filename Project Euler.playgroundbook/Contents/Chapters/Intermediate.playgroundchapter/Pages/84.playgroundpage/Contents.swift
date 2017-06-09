/*:
 # Monopoly odds
 [Problem 84](https://projecteuler.net/problem=84) - Difficulty level: 35%

 In the game, *Monopoly*, the standard board is set up in the following way:

 ![](84-1.png)

 A player starts on the GO square and adds the scores on two 6-sided dice to determine the number of squares they advance in a clockwise direction. Without any further rules we would expect to visit each square with equal probability: 2.5%. However, landing on G2J (Go To Jail), CC (community chest), and CH (chance) changes this distribution.

 In addition to G2J, and one card from each of CC and CH, that orders the player to go directly to jail, if a player rolls three consecutive doubles, they do not advance the result of their 3rd roll. Instead they proceed directly to jail.

 At the beginning of the game, the CC and CH cards are shuffled. When a player lands on CC or CH they take a card from the top of the respective pile and, after following the instructions, it is returned to the bottom of the pile. There are sixteen cards in each pile, but for the purpose of this problem we are only concerned with cards that order a movement; any instruction not concerned with movement will be ignored and the player will remain on the CC/CH square.

 - Community Chest (2/16 cards):
     1. Advance to GO
     2. Go to JAIL
 - Chance (10/16 cards):
     1. Advance to GO
     2. Go to JAIL
     3. Go to C1
     4. Go to E3
     5. Go to H2
     6. Go to R1
     7. Go to next R (railway company)
     8. Go to next R
     9. Go to next U (utility company)
     10. Go back 3 squares.

 The heart of this problem concerns the likelihood of visiting a particular square. That is, the probability of finishing at that square after a roll. For this reason it should be clear that, with the exception of G2J for which the probability of finishing on it is zero, the CH squares will have the lowest probabilities, as 5/8 request a movement to another square, and it is the final square that the player finishes at on each roll that we are interested in. We shall make no distinction between "Just Visiting" and being sent to JAIL, and we shall also ignore the rule about requiring a double to "get out of jail", assuming that they pay to get out on their next turn.

 By starting at GO and numbering the squares sequentially from 00 to 39 we can concatenate these two-digit numbers to produce strings that correspond with sets of squares.

 Statistically it can be shown that the three most popular squares, in order, are JAIL (6.24%) = Square 10, E3 (3.18%) = Square 24, and GO (3.09%) = Square 00. So these three most popular squares can be listed with the six-digit modal string: 102400.

 If, instead of using two 6-sided dice, two 4-sided dice are used, find the six-digit modal string.
*/
