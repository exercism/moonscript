class SaveTheCow
  new: (@word) =>
    @guessed = {}
    @errsAvailable = 9
    @state = 'Ongoing'

  guess: (letters) =>
    for guess in *letters
      if @state == 'Win'  then error 'cannot guess after the game is won'
      if @state == 'Lose' then error 'cannot guess after the game is lost'

      if @guessed[guess]
        @errsAvailable -= 1
      else
        found = not not @word\find guess
        @guessed[guess] = found
        if not found
          @errsAvailable -= 1

      @state = 'Lose' if @errsAvailable < 0
      @state = 'Win'  if not @mask!\find '_'

    @currentState!

  currentState: =>
    {
      state: @state,
      maskedWord: @mask!,
      remainingFailures: math.max 0, @errsAvailable
    }

  mask: =>
    @word\gsub '%a', (c) -> @guessed[c] and c or '_'


