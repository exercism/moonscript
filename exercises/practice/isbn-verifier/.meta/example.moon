{
  is_valid: (str) ->
    clean = str\gsub('-', '')
    return false if #clean != 10

    sum = 0
    for i = 1, 10
      char = clean\sub i, i
      digit = tonumber char     -- may return "fail"
      digit = 10 if i == 10 and char == 'X'
      return false if not digit
      sum += digit * (11 - i)

    sum % 11 == 0
}
