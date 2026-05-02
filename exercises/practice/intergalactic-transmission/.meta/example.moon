import fold from require 'moon'
BitList = require 'pl.List'

BitList.take = (self, i) -> self\slice 1, i
BitList.drop = (self, i) -> self\slice i + 1
BitList.parity = (self) -> fold({0, table.unpack self}, (c, b) -> c + b) & 1
BitList.addParityBit = (self) -> self\append self\parity!
BitList.todec = (self) -> fold {0, table.unpack self}, (n, b) -> n << 1 | b
BitList.tohex = (self) -> string.format '0x%02x', self\todec!
BitList.pad = (self, wid, elem) ->
  while #self < wid do self\append elem
  self

tobits = (bytes) ->
  bytes = [tonumber b\sub(3), 16 for b in *bytes]
  allBits = BitList!
  for byte in *bytes
    bits = BitList!
    for _ = 1, 8
      bits\insert 1, byte & 1
      byte >>= 1
    allBits\extend bits
  allBits


{
  transmitSequence: (sequence) ->
    seqBits = tobits sequence

    message = BitList!
    while #seqBits >= 7
      message\append seqBits\take(7)\addParityBit!\tohex!
      seqBits = seqBits\drop 7

    if #seqBits > 0
      message\append seqBits\pad(7, 0)\addParityBit!\tohex!
    message


  decodeMessage: (message) ->
    msgBits = tobits message

    seqBits = BitList!
    while #msgBits >= 8
      sevenBits = msgBits\take 7
      assert msgBits[8] == sevenBits\parity!, 'wrong parity'
      seqBits\extend sevenBits
      msgBits = msgBits\drop 8

    sequence = BitList!
    while #seqBits >= 8
      sequence\append seqBits\take(8)\tohex!
      seqBits = seqBits\drop 8
    sequence
}
