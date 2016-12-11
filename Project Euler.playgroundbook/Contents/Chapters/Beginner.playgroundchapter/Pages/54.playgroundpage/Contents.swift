/*:
 # Poker hands
 [Problem 54](https://projecteuler.net/problem=54) - Difficulty level: 10%

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
   var stringValue: String { get }
 }

 enum Suit {
   case spades, hearts, diamonds, clubs

   /// The value that was parsed from the text file e.g. "S" for `.spades`
   var stringValue: String { get }
 }

 struct Card {
   var rank: Rank { get }
   var suit: Suit { get }

   /// The value that was parsed from the text file e.g. "AS" for `.ace` of `.spades`
   var stringValue: String { get }

   init(rank: Rank, suit: Suit)
 
   init?(_ string: String)
 }
 ```
 */
//#-hidden-code
enum Rank: UInt8 {
  case ace = 1
  case two, three, four, five, six, seven, eight, nine, ten
  case jack, queen, king

  var stringValue: String {
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

  var stringValue: String {
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

  var stringValue: String {
    return rank.stringValue + suit.stringValue
  }

  init(rank: Rank, suit: Suit) {
    self.rank = rank
    self.suit = suit
  }

  init?(_ string: String) {
    guard string.characters.count == 2 else {
      return nil
    }

    switch string.characters.first! {
    case "2", "3", "4", "5", "6", "7", "8", "9":
      self.rank = Rank(rawValue: UInt8(String(string.characters.first!))!)!
    case "T":
      self.rank = .ten
    case "K":
      self.rank = .king
    case "Q":
      self.rank = .queen
    case "J":
      self.rank = .jack
    case "A":
      self.rank = .ace
    default:
      return nil
    }

    switch string.characters.last! {
    case "H":
      self.suit = .hearts
    case "D":
      self.suit = .diamonds
    case "C":
      self.suit = .clubs
    case "S":
      self.suit = .spades
    default:
      return nil
    }
  }
}

var _hands: [(player1: [Card], player2: [Card])]?
var hands: [(player1: [Card], player2: [Card])] {
  if _hands == nil {
    let contents = parseTextFile(named: "54-2")

    _hands = [(player1: [Card], player2: [Card])]()

    let deals = contents.components(separatedBy: "\n")
    for i in 0..<1000 {
      _hands?.append((player1: [Card](), player2: [Card]()))

      let cards = deals[i].components(separatedBy: " ")
      for j in 0..<cards.count {
        if j < 5 {
          _hands![i].player1.append(Card(cards[j])!)
        } else {
          _hands![i].player2.append(Card(cards[j])!)
        }
      }
    }
  }
  return _hands!
}
//#-end-hidden-code
//#-code-completion(identifier, hide, _hands)
