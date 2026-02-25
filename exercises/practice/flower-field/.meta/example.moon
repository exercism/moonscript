{
  annotate: (garden) ->
    if #garden < 1 return garden
    if #garden[1] < 1 return garden

    annotated = {}
    rows = #garden
    cols = #garden[1]

    for i = 1, rows
      rowStr = ''
      for j = 1, cols
        cell = garden[i]\sub(j, j)

        if cell == '*'
          rowStr ..= '*'
        else
          count = 0
          for dx = -1, 1
            for dy = -1, 1
              r = i + dx
              c = j + dy

              if r >= 1 and r <= rows and c >= 1 and c <= cols
                if garden[r]\sub(c, c) == '*'
                  count += 1
          
          if count == 0
             rowStr ..= ' '
          else
             rowStr ..= tostring(count)
             
      table.insert annotated, rowStr

    annotated
}
