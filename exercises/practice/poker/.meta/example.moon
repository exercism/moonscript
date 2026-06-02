List = require 'pl.List'
import fold from require 'moon'

class Card
  new: (cardString) =>
    @cardString = cardString
    @suit = cardString\sub -1
    @rank = switch cardString\sub 0, -2
      when 'A' then 14
      when 'K' then 13
      when 'Q' then 12
      when 'J' then 11
      else tonumber(cardString\sub 0, -2)

  __lt: (other) => @rank < other.rank
  __eq: (other) => @rank == other.rank
  __gt: (other) => @rank > other.rank

-- ------------------------------------------------------------------
class PokerHand
  new: (handString) =>
    @handString = handString
    @cards = List [Card cardString for cardString in handString\gmatch '%S+']
    @category, @value = @initialize!
  
  initialize: =>
    @cards\sort (a, b) -> a.rank > b.rank -- sort descending by rank
    
    ranks = [card.rank for card in *@cards]
    -- handle the ranks as the digits of a base-14 number, so we can easily compare hands of the same category
    ranking = (...) -> fold({0, ...}, (acc, rank) -> acc * 14 + rank)

    -- ignore five of a kind

    is_straight, straight_val = @isStraight!
    is_flush = @isFlush!

    if is_straight and is_flush
      return 2, ranking straight_val

    -- four of a kind
    if ranks[1] == ranks[4]
      return 3, ranking(ranks[1], ranks[5])
    elseif ranks[2] == ranks[5]
      return 3, ranking(ranks[2], ranks[1])

    -- full house
    if ranks[1] == ranks[3] and ranks[4] == ranks[5]
      return 4, ranking(ranks[1], ranks[4])
    elseif ranks[1] == ranks[2] and ranks[3] == ranks[5]
      return 4, ranking(ranks[3], ranks[1])

    if is_flush
      return 5, ranking(table.unpack ranks)  
    if is_straight
      return 6, ranking straight_val

    -- three of a kind
    if ranks[1] == ranks[3]
      return 7, ranking(ranks[1], ranks[4], ranks[5])
    elseif ranks[2] == ranks[4]
      return 7, ranking(ranks[2], ranks[1], ranks[5])
    elseif ranks[3] == ranks[5]
      return 7, ranking(ranks[3], ranks[1], ranks[2])

    -- two pair
    if ranks[1] == ranks[2] and ranks[3] == ranks[4]
      return 8, ranking(ranks[1], ranks[3], ranks[5])
    elseif ranks[1] == ranks[2] and ranks[4] == ranks[5]
      return 8, ranking(ranks[1], ranks[4], ranks[3])
    elseif ranks[2] == ranks[3] and ranks[4] == ranks[5]
      return 8, ranking(ranks[2], ranks[4], ranks[1])

    -- one pair
    for i = 1, 4
      if ranks[i] == ranks[i+1]
        return 9, ranking(ranks[i], table.unpack [ranks[j] for j = 1, 5 when j < i or j > i+1])
    
    -- high card
    return 10, ranking(table.unpack ranks)


  isFlush: =>
    suits = [card.suit for card in *@cards when card.suit == @cards[1].suit]
    #suits == #@cards

  isStraight: =>
    ranks = List [card.rank for card in *@cards]
    return true, 5 if ranks == {14, 5, 4, 3, 2}
    for i = 2, 5
      return false, 0 if ranks[i] != ranks[i-1] - 1
    true, ranks[1]

  isRoyalFlush: =>
    @isStraight() and @isFlush() and @cards[1].rank == 14 

  __lt: (other) =>
    -- lower category wins; if same category, higher value wins
    @category < other.category or (@category == other.category and @value > other.value)

  __eq: (other) =>
    @category == other.category and @value == other.value

-- ------------------------------------------------------------------
{
  bestHands: (handsStrings) ->
    hands = List [PokerHand hand for hand in *handsStrings]
    hands\sort!
    [hand.handString for hand in *hands when hand == hands[1]]
}
