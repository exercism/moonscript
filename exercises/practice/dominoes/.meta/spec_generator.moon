import indent, int_lists from require 'spec_helpers'

{
  module_imports: {'canChain'},

  generate_test: (case, level) ->
    lines = {
      "dominoes = #{int_lists case.input.dominoes, level}",
      "assert.is.#{case.expected} canChain dominoes"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
