{
  module_name: 'SimpleCipher',

  generate_test: (case, level) ->
    local lines
    switch case.uuid
      when "b8bdfbe1-bea3-41bb-a999-b41403f2b15d"
        lines = {
          "cipher = SimpleCipher!"
          "plaintext = #{quote case.input.plaintext}"
          "encoded = cipher\\encode plaintext"
          "expected = cipher\\key!\\sub(1, #plaintext)"
          "assert.are.equal expected, encoded"
        }
      when "3dff7f36-75db-46b4-ab70-644b3f38b81c"
        lines = {
          "cipher = SimpleCipher!"
          "expected = #{quote case.expected}"
          "ciphertext = cipher\\key!\\sub(1, #expected)"
          "decoded = cipher\\decode ciphertext"
          "assert.are.equal expected, decoded"
        }
      when "8143c684-6df6-46ba-bd1f-dea8fcb5d265"
        lines = {
          "cipher = SimpleCipher!"
          "plaintext = #{quote case.input.plaintext}"
          "ciphertext = cipher\\encode plaintext"
          "decoded = cipher\\decode ciphertext"
          "assert.are.equal plaintext, decoded"
        }
      when "defc0050-e87d-4840-85e4-51a1ab9dd6aa"
        lines = {
          "cipher = SimpleCipher!"
          "key = cipher\\key!"
          "assert.is.truthy key\\match('^[a-z]+$')"
        }
      when "70a16473-7339-43df-902d-93408c69e9d1"
        lines = {
          "cipher = SimpleCipher #{quote case.input.key}"
          "ciphertext = cipher\\encode #{quote case.input.plaintext}"
          "result = cipher\\decode ciphertext"
          "assert.are.equal #{quote case.expected}, result"
        }
      else
        switch case.property
          when "encode"
            lines = {
              "cipher = SimpleCipher #{quote case.input.key}"
              "result = cipher\\encode #{quote case.input.plaintext}"
              "assert.are.equal #{quote case.expected}, result"
            }
          when "decode"
            lines = {
              "cipher = SimpleCipher #{quote case.input.key}"
              "result = cipher\\decode #{quote case.input.ciphertext}"
              "assert.are.equal #{quote case.expected}, result"
            }
    table.concat [indent line, level for line in *lines], '\n'
}
