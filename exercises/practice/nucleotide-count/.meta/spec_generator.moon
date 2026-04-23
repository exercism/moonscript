import table_tostring_ordered from require 'test_helpers'

{
  module_name: 'nucleotide_count',

  generate_test: (case, level) ->
    local lines
    if case.expected.error
      lines = {
        "f = -> nucleotide_count '#{case.input.strand}'",
        "assert.has.errors f, '#{case.expected.error}'"
      }
    else
      -- use "same", not "equal", to compare tables
      lines = {
        "expected = #{table_tostring_ordered case.expected, {'A','C','G','T'}}"
        "result = nucleotide_count '#{case.input.strand}'",
        "assert.are.same expected, result"
      }

    table.concat [indent line, level for line in *lines], '\n'
}
