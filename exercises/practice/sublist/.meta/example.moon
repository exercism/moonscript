-- is b contained within a
contains = (a, b) ->
  for i = 1, #a - #b + 1
    if a[i] == b[1]
      found = true
      for j = 2, #b
        if a[i + j - 1] != b[j]
          found = false
          break
      return true if found
  false

{
  sublist: (list1, list2) ->
    if #list1 < #list2 and contains list2, list1
      'sublist'
    elseif #list1 > #list2 and contains list1, list2
      'superlist'
    elseif contains list1, list2
      'equal'
    else
      'unequal'
}
