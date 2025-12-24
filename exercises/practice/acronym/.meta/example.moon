{
  abbreviate: (input) ->
    acronym = ''
    state = 'alpha'

    for char in input\gmatch '.'
      switch state
        when 'alpha'
          if char\match '%a'
            acronym ..= char
            state = 'non-alpha'

        when 'non-alpha'
          if char\match "[^%a']"   -- apostrophe is considered a letter
            state = 'alpha'

    acronym\upper!
}
