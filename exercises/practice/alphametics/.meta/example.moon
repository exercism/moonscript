-- Returns a _map_ where the keys are initial letters of words in the puzzle.
-- These letters cannot be mapped to digit zero.
getLeadingDigits = (str) ->
  {c, true for c in str\gmatch '%f[%u].'}

-- Returns an ordered list of the last letters of each word in the puzzle.
getLastDigits = (str) ->
  [word\sub(-1) for word in str\gmatch '%u+']

-- Returns a list of the letters in the puzzle, prioritizing:
-- a) last letters
-- b) most frequently occurring letters
extractUniqueLetters = (str, lastLetters) ->
  alreadySeen, rest = {}, {}
  for c in *lastLetters
    alreadySeen[c] = (alreadySeen[c] or 0) + 1
  for c in str\gmatch '%u'
    if not alreadySeen[c]
      rest[c] = (rest[c] or 0) + 1

  orderedKeys = (freq) ->
    keys = [k for k, _ in pairs freq]
    table.sort keys, (a, b) -> freq[a] > freq[b]
    keys

  all = {}
  all[#all + 1] = c for c in *orderedKeys(alreadySeen)
  all[#all + 1] = c for c in *orderedKeys(rest)
  all

-- Does the mapping solve the puzzle?
isValid = (map, str) ->
  eqn = str\gsub '%a', (c) -> map[c]
  numbers = [tonumber num for num in eqn\gmatch '%d+']
  sum = 0
  sum += numbers[i] for i = 1, #numbers - 1
  sum == numbers[#numbers]

-- Do the numbers in the last column add up?
-- * Return nil if not all the letters have been mapped
-- * Otherwise return true or false
isLastColumnValid = (map, lastLetters) ->
  return nil if not map[lastLetters[#lastLetters]]
  sum = 0
  for i = 1, #lastLetters - 1
    return nil if not map[lastLetters[i]]
    sum += map[lastLetters[i]]
  (sum % 10) == map[lastLetters[#lastLetters]]

-- Does a key-value table contain a given falue
containsValue = (t, value) ->
  for key, val in pairs t
    if val == value
      return true
  false

-- --------------------------------------------------------------------------
solveAlphametics = (equation) ->
  leadingLetters = getLeadingDigits equation
  lastLetters = getLastDigits equation
  variables = extractUniqueLetters equation, lastLetters

  backtrack = (assignment, index) ->
    if index > #variables
      return if isValid(assignment, equation) then assignment else nil

    currentVar = variables[index]
    start = if leadingLetters[currentVar] then 1 else 0

    for digit = start, 9
      if not containsValue assignment, digit
        assignment[currentVar] = digit
        constraint = isLastColumnValid assignment, lastLetters
        if constraint == nil or constraint == true
          result = backtrack assignment, index + 1
          return result if result
        assignment[currentVar] = nil

    nil -- no solution found

  backtrack {}, 1

{
  solve: solveAlphametics
}
