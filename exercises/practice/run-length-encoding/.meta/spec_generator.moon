{
  module_imports: {'encode', 'decode'},

  generate_test: (case, level) ->
    local lines
    if case.property == 'consistency'
      lines = {
        "encoded = encode #{quote case.input.string}",
        "decoded = decode encoded",
        "assert.are.equal #{quote case.expected}, decoded"
      }
    else
      lines = {
        "result = #{case.property} #{quote case.input.string}",
        "assert.are.equal #{quote case.expected}, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
