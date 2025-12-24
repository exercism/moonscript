{
  find: (list, target) ->
    i, j = 1, #list
    while i <= j
      mid = (i + j) // 2
      element = list[mid]

      if target == element
        return mid
      elseif target < element 
        j = mid - 1
      else
        i = mid + 1

    error 'value not in array'
}
