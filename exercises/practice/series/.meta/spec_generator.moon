import word_list from require 'test_helpers'

{
  module_imports: {'slices'},

  generate_test: (case, level) ->
    cmd = "slices #{quote case.input.series}, #{case.input.sliceLength}"

    local lines
    if case.expected.error
      lines = {
        "f = -> #{cmd}"
        "assert.has_error f, #{quote case.expected.error}"
      }
    else
      lines = {
        "result = [slice for slice in #{cmd}]"
        "expected = #{word_list case.expected}"
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
