getCardValue = (card) ->
  switch card
    when 'J' then 1
    when 'Q' then 2
    when 'K' then 3
    when 'A' then 4
    else 0

Camicia =
  simulateGame: (playerA, playerB) ->
    handA = [getCardValue(card) for card in *playerA]
    handB = [getCardValue(card) for card in *playerB]

    turn = 'A'
    pile = {}
    seen = {}
    totalTricks = 0
    cardsPlayed = 0
    currentDebt = 0

    while true
      if #pile == 0
        round = table.concat(handA, ",") .. "|" .. table.concat(handB, ",") .. "|" .. turn
        if seen[round]
          return { status: 'loop', tricks: totalTricks, cards: cardsPlayed }
        seen[round] = true

      activeHand = if turn == 'A' then handA else handB
      otherHand = if turn == 'A' then handB else handA

      if #activeHand == 0
        extraTrick = if #pile == 0 then 0 else 1
        return { status: 'finished', tricks: totalTricks + extraTrick, cards: cardsPlayed }

      cardVal = table.remove(activeHand, 1)
      table.insert(pile, cardVal)
      cardsPlayed += 1

      if cardVal > 0
        currentDebt = cardVal
        turn = if turn == 'A' then 'B' else 'A'
      else
        if currentDebt > 0
          currentDebt -= 1
          if currentDebt == 0
            for p in *pile
              table.insert(otherHand, p)
            pile = {}
            totalTricks += 1
            currentDebt = 0

            if #handA == 0 or #handB == 0
              return { status: 'finished', tricks: totalTricks, cards: cardsPlayed }

            turn = if turn == 'A' then 'B' else 'A'
        else
          turn = if turn == 'A' then 'B' else 'A'

return Camicia
