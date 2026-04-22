class SimpleCipher
  new: () =>
    error 'Implement the constructor'

  key: =>
    error 'Implement the "key" method'

  encode: (plaintext) =>
    error 'Implement the "encode" method'

  decode: (ciphertext) =>
    error 'Implement the "decode" method'
