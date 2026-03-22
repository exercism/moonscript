parse = (input) ->
  markup = ""
  in_list = false

  open_list = ->
    if not in_list
      in_list = true
      markup ..= '<ul>'

  close_list = ->
    if in_list
      in_list = false
      markup ..= '</ul>'

  for line in input\gmatch "[^\n]+"
    -- handle the in-line markup
    line = line\gsub("__(.-)__", "<strong>%1</strong>")
    line = line\gsub("_(.-)_", "<em>%1</em>")

    -- is it a list item?
    text = line\match "^[*]%s+(.+)"
    if text
      open_list!
      markup ..= "<li>#{text}</li>"

    else
      close_list!

      -- is it a heading?
      header, text = line\match "^(#+)%s+(.+)"
      if header and #header <= 6
        tag = "h#{#header}"
        markup ..= "<#{tag}>#{text}</#{tag}>"

      -- it's a plain paragraph
      else
        markup ..= "<p>#{line}</p>"

  close_list!
  markup


{ :parse }

