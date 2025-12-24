{
    module_name: "raindrops",
    generate_test: (case, level) -> 
      lines = {
        "result = raindrops #{case.input.number}"
        "assert.are.equal '#{case.expected}', result"
      }
      table.concat [string.rep('  ', level) .. line for line in *lines], '\n'
}
