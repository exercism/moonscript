List = require 'pl.List'

{
  encode: (numbers) ->
    all_bytes = List!
    for num in *numbers
      bytes = List!
      while num > 0
        byte = num & 0x7F
        num >>= 7
        byte |= 0x80 if #bytes > 0
        bytes\put byte
      bytes\append 0 if #bytes == 0
      all_bytes\extend bytes
    all_bytes

  decode: (bytes) ->
    assert bytes[#bytes] & 0x80 == 0, 'incomplete sequence'
    numbers = List!
    current = 0
    for byte in *bytes
      current = (current << 7) | (byte & 0x7F)
      if (byte & 0x80) == 0
        numbers\append current
        current = 0
    numbers
}