{
  encode: (plaintext) ->
    encoded, prev, n = '', '', 0

    add_run = -> encoded ..= "#{if n <= 1 then '' else n}#{prev}"

    for char in plaintext\gmatch '.'
      if char != prev
        add_run!
        n = 1
        prev = char
      else
        n += 1
    add_run!
    encoded


  decode: (ciphertext) ->
    decoded, length = '', ''
    for char in ciphertext\gmatch '.'
      if char\find '%d'
        length ..= char
      else
        n = tonumber(length) or 1
        decoded ..= string.rep char, n
        length = ''
    decoded
}

