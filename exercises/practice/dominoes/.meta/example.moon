-- clone first list and append an element to the end of the new list
append = (list, elem) ->
  newList = {table.unpack list}
  table.insert newList, elem
  newList

removeIndex = (list, index) ->
  newList = {table.unpack list}
  table.remove(newList, index)
  newList

-- -------------------------------------------------------
chainer = (chain, remaining) ->
  if #remaining == 0
    return chain[1][1] == chain[#chain][2]

  last = chain[#chain][2]
  for i, domino in ipairs remaining
    if domino[1] == last
      nextChain = append chain, domino
      nextRemaining = removeIndex remaining, i
      return true if chainer nextChain, nextRemaining
    elseif domino[2] == last
      nextChain = append chain, {domino[2], domino[1]}
      nextRemaining = removeIndex remaining, i
      return true if chainer nextChain, nextRemaining

  false

-- -------------------------------------------------------
{
  canChain: (dominoes) ->
    return true if #dominoes == 0

    for i, domino in ipairs dominoes
      return true if chainer {domino}, removeIndex(dominoes, i)
    
    false
}
