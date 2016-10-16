/*:
 # Poker hands
 [Problem 54](https://projecteuler.net/problem=54) - Diifculty level: 10%

 In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:

 - **High Card:** Highest value card.
 - **One Pair:** Two cards of the same value.
 - **Two Pairs:** Two different pairs.
 - **Three of a Kind:** Three cards of the same value.
 - **Straight:** All cards are consecutive values.
 - **Flush:** All cards of the same suit.
 - **Full House:** Three of a kind and a pair.
 - **Four of a Kind:** Four cards of the same value.
 - **Straight Flush:** All cards are consecutive values of same suit.
 - **Royal Flush:** Ten, Jack, Queen, King, Ace, in same suit.

 The cards are valued in the order:
 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

 If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.

 Consider the following five hands dealt to two players:

 ![](54-1.png)

 The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.

 How many hands does Player 1 win?
 
 *NOTE: The contents of `poker.txt` are stored in: `var hands: [(player1: [Card], player2: [Card])] { get }`. `Card`s with their `Rank` and `Suit` have the following format:*
 ```
 enum Rank: UInt8 {
   case ace = 1
   case two, three, four, five, six, seven, eight, nine, ten
   case jack, queen, king

   /// The value that was parsed from the text file e.g. "A" for `.ace`
   var string: String { get }
 }

 enum Suit {
   case spades, hearts, diamonds, clubs

   /// The value that was parsed from the text file e.g. "S" for `.spades`
   var string: String { get }
 }

 struct Card {
   var rank: Rank { get }
   var suit: Suit { get }

   /// The value that was parsed from the text file e.g. "AS" for `.ace` of `.spades`
   var string: String { get }

   init(rank: Rank, suit: Suit)
 }
 ```
 */
//#-hidden-code
import Foundation

enum Rank: UInt8 {
  case ace = 1
  case two, three, four, five, six, seven, eight, nine, ten
  case jack, queen, king

  var string: String {
    switch self {
    case .ace:
      return "A"
    case .jack:
      return "J"
    case .queen:
      return "Q"
    case .king:
      return "K"
    case .ten:
      return "T"
    default:
      return "\(rawValue)"
    }
  }
}

enum Suit {
  case spades, hearts, diamonds, clubs

  var string: String {
    switch self {
    case .spades:
      return "S"
    case .hearts:
      return "H"
    case .diamonds:
      return "D"
    case .clubs:
      return "C"
    }
  }
}

struct Card {
  let rank: Rank
  let suit: Suit

  var string: String {
    return rank.string + suit.string
  }

  init(rank: Rank, suit: Suit) {
    self.rank = rank
    self.suit = suit
  }

  init(utf8CodeUnits: (rankUnit: UTF8.CodeUnit, suitUnit: UTF8.CodeUnit)) {
    switch utf8CodeUnits.rankUnit {
    case 50...57:
      // 2 - 9 (10 is refered to as T)
      self.rank = Rank(rawValue: utf8CodeUnits.rankUnit - 48)!
    case 84:
      self.rank = .ten
    case 75:
      self.rank = .king
    case 81:
      self.rank = .queen
    case 74:
      self.rank = .jack
    default:
      self.rank = .ace
    }

    switch utf8CodeUnits.suitUnit {
    case 72:
      self.suit = .hearts
    case 68:
      self.suit = .diamonds
    case 67:
      self.suit = .clubs
    default:
      self.suit = .spades
    }
  }
}

var _hands: [(player1: [Card], player2: [Card])]?
var hands: [(player1: [Card], player2: [Card])] {
  if _hands == nil {
    /**
     Which player to deal the card to.
     */
    enum HandDestination { case player1, player2 }

    let contents = parseTextFile(named: "54-2").utf8

    _hands = [(player1: [Card], player2: [Card])]()

    // Set up initial variables
    var handDealtTo = HandDestination.player1
    var lineNumber = 0
    var i = contents.startIndex

    repeat {
      defer {
        i = contents.index(after: i)
      }

      // Make sure we have a container to store data.
      if _hands!.count == lineNumber {
        let tuple = (player1: [Card](), player2: [Card]())
        _hands?.append(tuple)
      }

      // Get the current UTF8 code unit.
      let codeUnit = contents[i]

      // 32 is the SPACE character, keep going as there is nothing to do here.
      guard codeUnit != 32 else {
        continue
      }

      // If we have already dealt the first five cards to the first
      // player switch to player 2.
      if _hands![lineNumber].player1.count == 5 {
        handDealtTo = .player2
      }

      // 10 is LINE FEED or "\n", incease the line number and switch back to dealing to player 1
      if codeUnit == 10 {
        lineNumber += 1
        handDealtTo = .player1
        continue
      }

      // We have a card, let's build it. The rank is already stored in the `codeUnit` but we
      // need to advance 1 to get to the suit.
      i = contents.index(after: i)
      let card = Card(utf8CodeUnits: (rankUnit: codeUnit, suitUnit: contents[i]))
      // Actually deal the hand
      switch handDealtTo {
      case .player1:
        _hands![lineNumber].player1.append(card)
      case .player2:
        _hands![lineNumber].player2.append(card)
      }
    } while i != contents.endIndex
  }
  return _hands!
}
//#-end-hidden-code
//#-code-completion(identifier, hide, _hands)
